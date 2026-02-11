package com.application.mobileapp;

import android.content.Intent;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Splash_Screen extends AppCompatActivity {
    private ViewPager viewPager;
    //private LinearLayout linearLayout;
    private SplashAdapter splashAdapter;
    private TextView[] dots;
    private Button btnPrev;
    private Button btnSkip;
    private Button btnNext;
    private Button btnFinish;

    private  int currentPage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash__screen);

        viewPager= (ViewPager) findViewById(R.id.id_pager);
       // linearLayout= (LinearLayout) findViewById(R.id.dot_layout);

        btnNext= (Button) findViewById(R.id.btnNext);
        btnSkip= (Button) findViewById(R.id.btnSkip);
        btnPrev= (Button) findViewById(R.id.btnPrev);
        btnFinish= (Button) findViewById(R.id.btnFinish);

        splashAdapter= new SplashAdapter(this);
        viewPager.setAdapter(splashAdapter);

        //addDots(0);
        viewPager.addOnPageChangeListener(listener);

        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewPager.setCurrentItem(currentPage+1);
            }
        });

        btnPrev.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewPager.setCurrentItem(currentPage-1);
            }
        });

        btnSkip.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Login_Redirect();
            }
        });

        btnFinish.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Login_Redirect();
            }
        });
    }

    /*public void addDots(int position){
        dots= new TextView[6];
        for(int i= 0; i< dots.length;i++){
            dots[i] = new TextView(this);
            dots[i].setText(Html.fromHtml("&#8226;"));
            dots[i].setTextSize(35);
            dots[i].setTextColor(getResources().getColor(R.color.colorPrimary));

            linearLayout.addView(dots[i]);
        }
        if (dots.length>0){
            dots[position].setTextColor(getResources().getColor(R.color.colorPrimary));
        }

    }*/

    ViewPager.OnPageChangeListener listener= new ViewPager.OnPageChangeListener() {
        @Override
        public void onPageScrolled(int i, float v, int i1) {

        }

        @Override
        public void onPageSelected(int i) {
            //addDots(i);
            dots= new TextView[6];
            currentPage= i;
            if(currentPage== 0){
                btnNext.setEnabled(true);
                btnPrev.setEnabled(false);
                btnPrev.setVisibility(View.INVISIBLE );

                btnNext.setText("Next");
                // btnSkip.setText("Skip");
                btnPrev.setText("");


            }else if (i == dots.length-1){
                btnNext.setEnabled(false);
                btnNext.setVisibility(View.INVISIBLE);
                btnFinish.setEnabled(true);
                btnFinish.setVisibility(View.VISIBLE);
                btnPrev.setEnabled(true);
                btnPrev.setVisibility(View.VISIBLE );
                btnPrev.setText("Back");
            }else {
                btnNext.setEnabled(true);
                btnPrev.setEnabled(true);
                btnPrev.setVisibility(View.VISIBLE );

                btnNext.setText("Next");
                //btnSkip.setText("Skip");
                btnPrev.setText("Back");
            }
        }

        @Override
        public void onPageScrollStateChanged(int i) {

        }
    };

    public void Login_Redirect (){
        Intent intent= new Intent(this, Login.class);
        startActivity(intent );

    }
}
