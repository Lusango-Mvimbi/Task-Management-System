package com.application.mobileapp;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

public class Notification_Adapter extends RecyclerView.Adapter<Notification_Adapter.CustomViewHolder> {
    private ArrayList<Notification> Notification = new ArrayList<>();
    private Context context;

    public ArrayList<Notification> getNotification() {
        return Notification;
    }

    public Context getContext() {
        return context;
    }

    public Notification_Adapter(Context context, ArrayList<Notification> Notification){
        this.Notification= Notification;
        this.context= context;
    }
    @NonNull
    @Override
    public Notification_Adapter.CustomViewHolder onCreateViewHolder( @NonNull ViewGroup viewGroup, int i) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.notification_card, viewGroup, false);
        return new Notification_Adapter.CustomViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Notification_Adapter.CustomViewHolder customViewHolder, int i) {

        customViewHolder.notiDesciprion.setText(Notification.get(i).getDescription());
        customViewHolder.notiTitle.setText(Notification.get(i).getFrom_Username());

    }

    @Override
    public int getItemCount() {
        return Notification.size();
    }

    public class CustomViewHolder extends RecyclerView.ViewHolder {
        private TextView notiDesciprion, notiTitle;

        public CustomViewHolder(@NonNull View itemView){
            super(itemView);

            notiDesciprion = (TextView) itemView.findViewById(R.id.notification_Description);
            notiTitle = (TextView) itemView.findViewById(R.id.notification_Title);

        }
    }
}