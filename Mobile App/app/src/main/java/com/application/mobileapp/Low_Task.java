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

public class Low_Task extends Fragment {

    //declaring required variables for Urgent Tasks
    View myView_Low;
    ArrayList<Tasks> UserTasks, UserLow = new ArrayList<>();
    private RecyclerView LowTasks_recyclerView;
    private RecycleView_Adapter ACS_recycleView_adapter ;

    //required Empty Constructor
    public Low_Task() {}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        myView_Low = inflater.inflate(R.layout.fragment_low__task, container, false);

        LowTasks_recyclerView = (RecyclerView) myView_Low.findViewById(R.id.id_recyclerView_Low);
        LowTasks_recyclerView.setLayoutManager(new LinearLayoutManager(getContext()));

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
                for (int x = 0; x <UserTasks.size(); x++) {
                    if (UserTasks.get(x).getAssigned_To().contains(Login.myUser.getUsername()) && UserTasks.get(x).getPriority_level().equals("Low") && UserTasks.get(x).getStatus().equals("active")) {
                        UserLow.add(UserTasks.get(x));
                    }
                }
                ACS_recycleView_adapter = new RecycleView_Adapter(getContext(), UserLow);

                LowTasks_recyclerView.setAdapter(ACS_recycleView_adapter);
            }


            @Override
            public void onFailure(Call<List<Tasks>> call, Throwable t) {
                Toast.makeText(getActivity(), "Failed", Toast.LENGTH_SHORT).show();
                //testingResult.setText(t.getMessage());
            }

        });
        return myView_Low;
    }
}
