package com.application.mobileapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.MenuItem;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class Log_tracker extends AppCompatActivity {

    ArrayList<Log> AllLogs, userLogs = new ArrayList<>();
    ArrayList<Feedback> AllFeed, LogFeedback = new ArrayList<>();
    private Log_Adapter log_adapter;
    private RecyclerView log_recyclerview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_log_tracker);

        log_recyclerview = (RecyclerView) findViewById(R.id.id_recyclerview_Tracker);
        log_recyclerview.setLayoutManager(new LinearLayoutManager(this));

        final APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);

        //getting Logs  marcia@acs.co
        Call<List<Log>> call_log = myAPI.getLogs();
        call_log.enqueue(new Callback<List<Log>>() {
            @Override
            public void onResponse(Call<List<Log>> call, Response<List<Log>> response) {
                if(!response.isSuccessful()){
                    return;
                }
                AllLogs = new ArrayList<>(response.body());
                for(int l = 0;l<AllLogs.size();l++){
                    if(AllLogs.get(l).getUsername().contains(Login.myUser.getUsername())){
                        userLogs.add(AllLogs.get(l));

                    }
                }


                        log_adapter = new Log_Adapter(Log_tracker.this,userLogs);

                        log_recyclerview.setAdapter(log_adapter);
            }

            @Override
            public void onFailure(Call<List<Log>> call, Throwable t) {

            }
        });






        BottomNavigationView bottomNav = (BottomNavigationView) findViewById( R.id.bottom_nav);
        bottomNav.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                switch (menuItem.getItemId()){
                    case R.id.id_dashboard:
                        Intent intent= new Intent(Log_tracker.this, MainActivity.class);
                        startActivity(intent);
                        break;
                    case R.id.id_incident:
                        Intent intent2= new Intent(Log_tracker.this, incident_activity.class);
                        startActivity(intent2);
                        break;
                    case R.id.id_notifications :
                        Intent intent3= new Intent(Log_tracker.this, notification_Activity.class);
                        startActivity(intent3);
                        break;
                    case R.id.id_tracking :
                        Intent intent4 = new Intent(Log_tracker.this, Log_tracker.class);
                        startActivity(intent4);
                }
                return false;
            }
        });
    }
}
