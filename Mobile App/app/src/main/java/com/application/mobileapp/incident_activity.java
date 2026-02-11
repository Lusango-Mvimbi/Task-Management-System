package com.application.mobileapp;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.design.widget.TabItem;
import android.support.design.widget.TabLayout;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.view.MenuItem;
import android.widget.Toast;

import java.util.*;

import retrofit2.*;
import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;


public class incident_activity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_incident);

        TabLayout layout= (TabLayout) findViewById(R.id.tablayout2);
        layout.addTab(layout.newTab().setText("ITS"));
        layout.addTab((layout.newTab().setText("CyberTech")));


        final ViewPager pager= findViewById(R.id.viewPager2);
        final Tab_Page_Adapter2 pageAdapter = new Tab_Page_Adapter2(getSupportFragmentManager(),layout.getTabCount());
        pager.setAdapter(pageAdapter);
        pager.addOnPageChangeListener( new TabLayout.TabLayoutOnPageChangeListener(layout));

        layout.setOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {
            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                pager.setCurrentItem(tab.getPosition());
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {

            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {

            }
        });












        //Here its a function of the bottom navigation bar to help you navigate to other linked fragments
        BottomNavigationView bottomNav = (BottomNavigationView) findViewById( R.id.bottom_nav);
        bottomNav.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.id_dashboard:
                        Intent intent= new Intent(incident_activity.this, MainActivity.class);
                        startActivity(intent);
                        break;

                    case R.id.id_incident:
                        Intent intent2= new Intent(incident_activity.this, incident_activity.class);
                        startActivity(intent2);
                        break;
                    case R.id.id_notifications :
                        Intent intent3= new Intent(incident_activity.this, notification_Activity.class);
                        startActivity(intent3);
                        break;
                    case R.id.id_tracking :
                        Intent intent4 = new Intent(incident_activity.this, Log_tracker.class);
                        startActivity(intent4);
                }
                return false;
            }
        });

    }
}

