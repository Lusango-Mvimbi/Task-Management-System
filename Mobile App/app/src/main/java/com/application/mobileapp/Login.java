package com.application.mobileapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class Login extends AppCompatActivity {
    CardView cardView;
    TextView txtForgot;
    //credrntials
    private EditText myUsername;
    private EditText myPassword;
    public static User myUser;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        cardView = (CardView) findViewById(R.id.card_Login);
        myUsername =  (EditText) findViewById(R.id.txtUsername);
        myPassword=(EditText) findViewById(R.id.txtPassword);
        txtForgot = (TextView) findViewById(R.id.id_ForgotPassword);
        cardView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
               //Validating User Input
               // Dashboard_Redirect();
                if(myUsername.getText().length()==0){
                    myUsername.setError("Please Enter Username. #Hint (Username is Should be work email)");
                }else  if(myPassword.getText().length()==0){
                    myPassword.setError("Please Enter Password.");

                }else {





                    // object request of my GET function call
                    APIClient myAPI = BASE_url.getBASE_url().create(APIClient.class);
                    String Username = myUsername.getText().toString();
                    String Password = myPassword.getText().toString();

                    Call<User> SignIn = myAPI.findUser(Username,Password);
                    SignIn.enqueue(new Callback<User>() {
                        @Override
                        public void onResponse(Call<User> call, Response<User> response) {
                            if (!response.isSuccessful()) {
                                txtForgot.setText("Invalid Credentials");
                                return;
                            }
                            if(response.body() == null){
                                txtForgot.setText("Invalid Credentials. Contact System Adminstrator");
                            }else{
                                myUser =  response.body();

                                Dashboard_Redirect();
                            }

                            //redirecting to home page

                        }
                        @Override
                        public void onFailure(Call<User> call, Throwable t) {
                            //   Dashboard_Redirect();
                           txtForgot.setText(t.getMessage());
                            //Toast.makeText(Login.this, t.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                    });
                }
                    //login in user with username and password

                }
            });}






    public void Dashboard_Redirect (){
        Intent intent= new Intent(this, MainActivity.class);
        startActivity(intent );

    }
}



