package com.application.mobileapp;

import android.content.ClipData;
import android.content.Intent;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.design.widget.TabItem;
import android.support.design.widget.TabLayout;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.support.v7.widget.Toolbar;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity{




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TabLayout layout= (TabLayout) findViewById(R.id.tablayout);

        layout.addTab(layout.newTab().setText("New"));
        layout.addTab(layout.newTab().setText("Urgent"));
        layout.addTab(layout.newTab().setText("Normal"));
        layout.addTab(layout.newTab().setText("Low"));
        layout.addTab(layout.newTab().setText("Sent For Review"));
       // layout.setTabGravity(TabLayout.GRAVITY_FILL);


        final ViewPager pager= findViewById(R.id.viewPager);
        final Tab_Page_Adapter pageAdapter = new Tab_Page_Adapter(getSupportFragmentManager(),layout.getTabCount());
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



       BottomNavigationView bottomNav = (BottomNavigationView) findViewById( R.id.bottom_nav);
        bottomNav.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.id_dashboard:
                        Intent intent= new Intent(MainActivity.this, MainActivity.class);
                        startActivity(intent);
                        break;
                    case R.id.id_incident:
                        Intent intent2= new Intent(MainActivity.this, incident_activity.class);
                        startActivity(intent2);
                        break;
                    case R.id.id_notifications :
                        Intent intent3= new Intent(MainActivity.this, notification_Activity.class);
                        startActivity(intent3);
                        break;
                    case R.id.id_tracking :
                        Intent intent4 = new Intent(MainActivity.this, Log_tracker.class);
                        startActivity(intent4);
                }
                return false;
            }
        });
    }


}

