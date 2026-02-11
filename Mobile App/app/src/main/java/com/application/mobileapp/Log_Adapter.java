package com.application.mobileapp;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.annotation.NonNull;
import android.support.v7.widget.CardView;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;


import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Log_Adapter extends RecyclerView.Adapter<Log_Adapter.CustomViewHolder> {
    private ArrayList<Log> Logs = new ArrayList<>();
    private ArrayList<Feedback> Feedback, LogFeed = new ArrayList<>();
    private Context context;
    private Dialog Feedback_dialog;

    public ArrayList<Log> getLog() {
        return Logs;
    }

    public Context getContext() {
        return context;
    }

    public Log_Adapter(Context context, ArrayList<Log> myLogs){
        this.Logs= myLogs;
        this.context= context;

    }
    @NonNull
    @Override
    public Log_Adapter.CustomViewHolder onCreateViewHolder( @NonNull ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.log_card, viewGroup, false);

        final Log_Adapter.CustomViewHolder viewHolder = new Log_Adapter.CustomViewHolder(view);
        //Initialising Dialog
        Feedback_dialog= new Dialog(context);
        Feedback_dialog.setContentView(R.layout.feedback);
        Feedback_dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));



        //setting my card to be clickable
        viewHolder.log_card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

            }
        });

        return new Log_Adapter.CustomViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Log_Adapter.CustomViewHolder customViewHolder, int i) {
        final int  _i = i;
        customViewHolder.log_status.setText(Logs.get(i).getStatus());
        customViewHolder.log_title.setText(Logs.get(i).getIncident());
        customViewHolder.log_card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                TextView feedbackTitle = (TextView) Feedback_dialog.findViewById(R.id.feedbackTitle);
                TextView feedbackDescription = (TextView) Feedback_dialog.findViewById(R.id.feedbackDescription);
                TextView Log_status = (TextView) Feedback_dialog.findViewById(R.id.feedbackStatus);

                feedbackTitle.setText(Logs.get(_i).getIncident());
                Log_status.setText(Logs.get(_i).getStatus());
                feedbackDescription.setText(Logs.get(_i).getDescription());

                Feedback_dialog.show();
            }
        });

    }

    @Override
    public int getItemCount() {
        return Logs.size();
    }

    public class CustomViewHolder extends RecyclerView.ViewHolder {
        private TextView log_status, log_title;
        private CardView log_card;

        public CustomViewHolder(@NonNull View itemView){
            super(itemView);

            log_card= (CardView) itemView.findViewById(R.id.id_logCard);
            log_status = (TextView) itemView.findViewById(R.id.log_status);
            log_title = (TextView) itemView.findViewById(R.id.log_title);

        }
    }
}