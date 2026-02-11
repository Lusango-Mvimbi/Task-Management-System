package com.application.mobileapp;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.application.mobileapp.*;


import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class Normal_Task extends Fragment {

    //declaring required variables for class
    View myView_Normal;
    ArrayList<Tasks> UserTasks = new ArrayList<>();
    ArrayList<Tasks> UserNormalTasks = new ArrayList<>();
    private RecycleView_Adapter ACS_recycleView_adapter ;
    private RecyclerView NormalTasks_recyclerView;

    //Required Empty Constructor
    public Normal_Task(){}




    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {


        myView_Normal = inflater.inflate(R.layout.fragment_normal__task, container, false);

        NormalTasks_recyclerView = (RecyclerView) myView_Normal.findViewById(R.id.id_recyclerView_Normal);

           // NormalTasks_recyclerView.setHasFixedSize(true);
            NormalTasks_recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

        // object request of my GET function call
        APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);

        Call<List<Tasks>> call = myAPI.getTickets();
        call.enqueue(new Callback<List<Tasks>>() {
            @Override
            public void onResponse(Call<List<Tasks>> call, Response<List<Tasks>> response) {

                if(!response.isSuccessful()){
                    return;
                }

                UserTasks = new ArrayList<>(response.body());
                for (int x = 0; x < UserTasks.size(); x++) {
                    if (UserTasks.get(x).getAssigned_To().contains(Login.myUser.getUsername()) && UserTasks.get(x).getPriority_level().equals("Normal") && UserTasks.get(x).getStatus().equals("active")) {
                        UserNormalTasks.add(UserTasks.get(x));
                    }
                }
                ACS_recycleView_adapter = new RecycleView_Adapter(getContext(), UserNormalTasks);

                NormalTasks_recyclerView.setAdapter(ACS_recycleView_adapter);
            }


            @Override
            public void onFailure(Call<List<Tasks>> call, Throwable t) {
                Toast.makeText(getActivity(), "Failed", Toast.LENGTH_SHORT).show();
                //testingResult.setText(t.getMessage());
            }

        });








        // Inflate the layout for this fragment
        return myView_Normal;
    }







}
