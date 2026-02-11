package com.application.mobileapp;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class Urgent_Task extends Fragment {

    //declaring required variables for Urgent Tasks
    View myView_Urgent;
    ArrayList<Tasks> UserTasks, UserUrgent = new ArrayList<>();
    private RecyclerView UrgentTasks_recyclerView;
    private RecycleView_Adapter ACS_recycleView_adapter ;

    //required Empty Constructor
    public Urgent_Task() {}


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        myView_Urgent = inflater.inflate(R.layout.fragment_urgent__task, container, false);

        UrgentTasks_recyclerView = (RecyclerView) myView_Urgent.findViewById(R.id.id_recyclerView_Urgent);
        UrgentTasks_recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

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
                    if (UserTasks.get(x).getAssigned_To().contains(Login.myUser.getUsername()) && UserTasks.get(x).getPriority_level().equals("Urgent") && UserTasks.get(x).getStatus().equals("active")) {
                        UserUrgent.add(UserTasks.get(x));
                    }
                }
                ACS_recycleView_adapter = new RecycleView_Adapter(getContext(), UserUrgent);

                UrgentTasks_recyclerView.setAdapter(ACS_recycleView_adapter);
            }


            @Override
            public void onFailure(Call<List<Tasks>> call, Throwable t) {
                Toast.makeText(getActivity(), "Failed", Toast.LENGTH_SHORT).show();
                //testingResult.setText(t.getMessage());
            }

        });
        // Inflate the layout for this fragment
        return myView_Urgent;


    }

}
