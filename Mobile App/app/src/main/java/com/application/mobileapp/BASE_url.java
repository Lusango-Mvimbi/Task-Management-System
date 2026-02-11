package com.application.mobileapp;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class BASE_url {
    public static final String BASE_URL= "http://10.254.184.48:45455/";
    public static Retrofit retrofit= null;

    public static Retrofit getBASE_url(){

        if(retrofit == null){
            retrofit = new Retrofit.Builder().baseUrl(BASE_URL)
                            .addConverterFactory(GsonConverterFactory.create()).build();
        }
        return retrofit;
    }
}
