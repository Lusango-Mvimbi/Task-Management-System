package com.application.mobileapp;
import retrofit2.http.*;
import retrofit2.http.PUT;
import retrofit2.http.Path;
import retrofit2.Call;
import java.util.*;

public interface APIClient {
    //Get request for All tickets
    @GET("GetAllTickets")
    Call<List<Tasks>> getTickets();

    //get user by username
    @GET("SignIn")
    Call<User> findUser(@Query("user") String user,@Query("pass") String password);

    @POST("Accept")
    Call<Boolean> Accept(@Query("id") int TaskID);

    @POST("Submit")
    Call<Boolean> Submit(@Query("id") int TaskID);


    @POST("CreateLog")
    Call<Boolean> createIncidentLog(@Body Log newLog);

    @GET("GetAllNotifications")
    Call<List<Notification>> getNotification();

    @GET("GetAllLogs")
    Call<List<Log>> getLogs();

    @GET("GetAllFeedback")
    Call<List<Feedback>> getFeedbacks();

    @GET("GetAllIncidents")
    Call<List<Incident>> getIncidentType();

}
