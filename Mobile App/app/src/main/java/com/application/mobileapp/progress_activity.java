package com.application.mobileapp;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.MenuItem;

public class progress_activity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_progress);

        //Here its a function of the bottom navigation bar to help you navigate to other linked fragments
        BottomNavigationView bottomNav = (BottomNavigationView) findViewById( R.id.bottom_nav);
        bottomNav.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.id_dashboard:
                        Intent intent= new Intent(progress_activity.this, MainActivity.class);
                        startActivity(intent);
                        break;
                   /* case R.id.id_progress:
                        Intent intent2= new Intent(progress_activity.this, progress_activity.class);
                        startActivity(intent2);
                        break;*/
                    case R.id.id_incident:
                        Intent intent3= new Intent(progress_activity.this, incident_activity.class);
                        startActivity(intent3);
                        break;
                    /*case R.id.id_notifications :
                        Intent intent4= new Intent(progress_activity.this, notification_Activity.class);
                        startActivity(intent4);
                        break;*/
                }
                return false;
            }
        });
    }
}
