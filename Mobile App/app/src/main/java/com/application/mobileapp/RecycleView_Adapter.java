package com.application.mobileapp;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.annotation.NonNull;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RecycleView_Adapter extends RecyclerView.Adapter<RecycleView_Adapter.CustomViewHolder> {
    private ArrayList<Tasks> tasks = new ArrayList<>();
    private Context context;
    private Dialog dialog;

    public ArrayList<Tasks> getTasks() {
        return tasks;
    }

    public Context getContext() {
        return context;
    }

    public RecycleView_Adapter(Context context, ArrayList<Tasks> tasks){
        this.tasks= tasks;
        this.context= context;
    }
    @NonNull
    @Override
    public RecycleView_Adapter.CustomViewHolder onCreateViewHolder( @NonNull ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.card_ui, viewGroup, false);

            final CustomViewHolder viewHolder = new CustomViewHolder(view);
            //Initialising Dialog
            dialog= new Dialog(context);
            dialog.setContentView(R.layout.task_dialog);
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));




        return new RecycleView_Adapter.CustomViewHolder(view);
    }


    @Override
    public void onBindViewHolder(@NonNull RecycleView_Adapter.CustomViewHolder customViewHolder, int i) {
         final int  _i = i;
            customViewHolder.task__status.setText(tasks.get(i).getStatus());
            customViewHolder.task_title.setText(tasks.get(i).getTitle());
            customViewHolder.task_priority.setText(tasks.get(i).getPriority_level());

            /*String myString, mydate, mytime, time;
            myString = tasks.get(i).getDate_Deadline() + "";

        mydate= myString.split("T")[0];
        mytime =myString.split("T")[1];
        time= mytime.split(".")[0];*/


        customViewHolder.task_deadline.setText(tasks.get(i).getDate_Deadline());
            customViewHolder.cardUI.setOnClickListener(new View.OnClickListener() {
                @SuppressLint("ResourceAsColor")
                @Override
                public void onClick(View v) {
                    TextView dialogTitle = (TextView) dialog.findViewById(R.id.dialogTitle);
                    TextView dialogDescription = (TextView) dialog.findViewById(R.id.dialogDescription);
                    TextView dialogStatus = (TextView) dialog.findViewById(R.id.dialogStatus);
                    Button Accept = (Button) dialog.findViewById(R.id.btnAccept);

                    if(tasks.get(_i).getStatus().equals("open")){
                        Accept.setText("Begin Task");
                        Accept.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                int Task_ID = tasks.get(_i).getID();
                               final boolean respons;
                                // object request of my GET function call
                                APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);
                                Call<Boolean> AcceptTask = myAPI.Accept(Task_ID);
                                AcceptTask.enqueue(new Callback<Boolean>() {
                                    @Override
                                    public void onResponse(Call<Boolean> call, Response<Boolean> response) {
                                        if(!response.isSuccessful()){
                                            return;
                                        }


                                       dialog.dismiss();
                                    }

                                    @Override
                                    public void onFailure(Call<Boolean> call, Throwable t) {

                                    }
                                });
                            }
                        });

                        dialogTitle.setText(tasks.get(_i).getTitle());
                        dialogDescription.setText(tasks.get(_i).getDescription());
                        dialogStatus.setText(tasks.get(_i).getStatus());
                        dialogStatus.setTextColor(R.color.colorStatus);
                    }else if(tasks.get(_i).getStatus().equals("active")){
                        Accept.setText("Submit Task");
                        Accept.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                int Task_ID = tasks.get(_i).getID();
                                final boolean respons;
                                // object request of my GET function call
                                APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);
                                Call<Boolean> Submit = myAPI.Submit(Task_ID);
                                Submit.enqueue(new Callback<Boolean>() {
                                    @Override
                                    public void onResponse(Call<Boolean> call, Response<Boolean> response) {
                                        if(!response.isSuccessful()){
                                            return;
                                        }

                                          dialog.dismiss();

                                    }

                                    @Override
                                    public void onFailure(Call<Boolean> call, Throwable t) {

                                    }
                                });
                            }
                        });
                        dialogTitle.setText(tasks.get(_i).getTitle());
                        dialogDescription.setText(tasks.get(_i).getDescription());     dialogStatus.setText(tasks.get(_i).getStatus());
                        dialogStatus.setTextColor(R.color.colorStatus);

                    }else if(tasks.get(_i).getStatus().equals("underEvalution") ||  tasks.get(_i).getStatus().equals("solved")){
                        Accept.setVisibility(View.INVISIBLE);
                        dialogTitle.setText(tasks.get(_i).getTitle());
                        dialogDescription.setText(tasks.get(_i).getDescription());
                        dialogStatus.setText(tasks.get(_i).getStatus());
                        dialogStatus.setTextColor(R.color.colorStatus);

                    }
                    // the code below crushes and its the one required (link: https://www.youtube.com/watch?v=Zd0TUuoPP-s&t=3s)
                    //getting information per task



                    dialog.show();
                }
            });

    }

    @Override
    public int getItemCount() {
        return tasks.size();
    }

    public class CustomViewHolder extends RecyclerView.ViewHolder {
            private TextView task__status, task_title, task_priority,task_deadline;
            private CardView cardUI;

            public CustomViewHolder(@NonNull View itemView){
                super(itemView);

                cardUI= (CardView) itemView.findViewById(R.id.id_CardUI);
                task__status = (TextView) itemView.findViewById(R.id.text_view_status);
                task_title = (TextView) itemView.findViewById(R.id.text_view_title);
                task_priority = (TextView) itemView.findViewById(R.id.text_view_priority);
                task_deadline = (TextView) itemView.findViewById(R.id.text_view_Deadline);
        }
    }
}
