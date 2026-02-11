package com.application.mobileapp;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class notification_Activity extends AppCompatActivity {

    ArrayList<Notification> Notification = new ArrayList<>();
    ArrayList<Notification> userNotification = new ArrayList<>();
    private Notification_Adapter notification_adapter;
    private RecyclerView notification_recyclerview;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);


        notification_recyclerview = (RecyclerView) findViewById(R.id.id_recyclerview);
        notification_recyclerview.setLayoutManager(new LinearLayoutManager(this));


        //final ListView listView= findViewById(R.id.list_id);
        //  testingResult = findViewById(R.id.text_view_result);
        //connection to the base Url

        // object request of my GET function call
        APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);

        Call<List<Notification>> call = myAPI.getNotification();
        call.enqueue(new Callback<List<Notification>>() {
            @Override
            public void onResponse(Call<List<Notification>> call, Response<List<Notification>> response) {
                Notification = new ArrayList<>(response.body());

                for(int i =0;i< Notification.size();i++){
                    if(Notification.get(i).getTo_Username().contains(Login.myUser.getUsername())){
                        userNotification.add(Notification.get(i));
                    }
                }

                notification_adapter = new Notification_Adapter(notification_Activity.this, userNotification);
                notification_recyclerview.setAdapter(notification_adapter);
            }

            @Override
            public void onFailure(Call<List<Notification>> call, Throwable t) {
                Toast.makeText(notification_Activity.this, "Failed", Toast.LENGTH_SHORT).show();
            }
        });

        BottomNavigationView bottomNav = (BottomNavigationView) findViewById( R.id.bottom_nav);
        bottomNav.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.id_dashboard:
                        Intent intent= new Intent(notification_Activity.this, MainActivity.class);
                        startActivity(intent);
                        break;
                    case R.id.id_incident:
                        Intent intent2= new Intent(notification_Activity.this, incident_activity.class);
                        startActivity(intent2);
                        break;
                    case R.id.id_notifications :
                        Intent intent3= new Intent(notification_Activity.this, notification_Activity.class);
                        startActivity(intent3);
                        break;
                    case R.id.id_tracking :
                        Intent intent4 = new Intent(notification_Activity.this, Log_tracker.class);
                        startActivity(intent4);
                }
                return false;
            }
        });
    }

}
