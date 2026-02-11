package com.application.mobileapp;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v7.widget.CardView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class CyberTech extends Fragment {
    View view;

    ArrayList<Incident> Incident, Cybertech_Incident = new ArrayList<>();
    private Spinner spinnerProblem2;
    private CardView mySubmit2;
    private EditText myDescription2;
    String item , _Description;
    Boolean Post_response ;
    public CyberTech() {

    }



    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        view= inflater.inflate(R.layout.fragment_cyber_tech, container, false);

        spinnerProblem2 = (Spinner) view.findViewById(R.id.id_SpinnerType2);
        myDescription2 = (EditText) view.findViewById(R.id.txtDescription2);
        mySubmit2 = (CardView) view.findViewById(R.id.card_Submit2) ;

        // object request of my GET function call
        final APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);

        Call<List<Incident>> call_Incidents = myAPI.getIncidentType();

        call_Incidents.enqueue(new Callback<List<Incident>>() {
            @Override
            public void onResponse(Call<List<Incident>> call, Response<List<Incident>> response) {
                if (!response.isSuccessful()) {
                    return;
                }

                Incident = new ArrayList<>(response.body());
                for (int x = 0; x < Incident.size(); x++) {
                    if (Incident.get(x).getDivisionID() == 3) {
                        Cybertech_Incident.add(Incident.get(x));
                    }
                }
                List<String> Cybertech_Incident_Type = new ArrayList<>();
                Cybertech_Incident_Type.add(0, "Choose Incident Type");
                for (int a = 0; a < Cybertech_Incident.size(); a++) {
                    Cybertech_Incident_Type.add(Cybertech_Incident.get(a).getName());

                }

                ArrayAdapter<String> _myAdapter = new ArrayAdapter<>(getActivity(), android.R.layout.simple_spinner_item, Cybertech_Incident_Type);
                _myAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                spinnerProblem2.setAdapter(_myAdapter);
                spinnerProblem2.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                    @Override
                    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                        if(parent.getItemAtPosition(position).equals("Choose Incident Type")) {
                            //Do not do anything
                        } else {
                            item = parent.getItemAtPosition(position).toString();

                            Toast.makeText(parent.getContext(), "Selected: " + item, Toast.LENGTH_SHORT).show();

                        }

                    }

                    @Override
                    public void onNothingSelected(AdapterView<?> parent) {

                    }
                });


            }

            @Override
            public void onFailure(Call<List<Incident>> call, Throwable t) {

            }

        });

        mySubmit2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                _Description = myDescription2.getText().toString();

                Log new_Log = new Log(0,Login.myUser.getUsername(),"CyberTech",item,_Description,"  "," ");

                Call<Boolean> Post_Log = myAPI.createIncidentLog(new_Log);
                Post_Log.enqueue(new Callback<Boolean>() {
                    @Override
                    public void onResponse(Call<Boolean> call, Response<Boolean> response) {
                        if(!response.isSuccessful()){
                            return;
                        }
                        Post_response = response.body();
                        if(Post_response){
                            Toast.makeText(getContext(), "Incident logged to CyberTech" , Toast.LENGTH_SHORT).show();
                            Tracker_Redirect();
                        }
                    }

                    @Override
                    public void onFailure(Call<Boolean> call, Throwable t) {

                    }
                });
            }
        });


        return view;
    }

    public void Tracker_Redirect (){
        Intent intent= new Intent(getActivity(), Log_tracker.class);
        startActivity(intent );
    }
}
