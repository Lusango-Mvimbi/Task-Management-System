package com.application.mobileapp;

import android.content.Context;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.v4.view.PagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class SplashAdapter extends PagerAdapter {

    Context  context;
    LayoutInflater layoutInflater;
    public SplashAdapter(Context context){
        this.context= context;
    }

    //Arrays
    public int[] splash_images={
            R.drawable.logo,
            R.drawable.cyber_security,
            R.drawable.card_personalisation,
            R.drawable.field_services,
            R.drawable.payment_processing,
            R.drawable.public_transport
    };

    public String[] splash_headings={
            "",
            "cyber security services",
            "card personalisation",
            "field services",
            "secure payment processing",
            "public transport"
    };

    public String[] splash_desc={
            "",
            "We understand the risks associated with any cyber security environment, and can help you to analyse and identify strengths and vulnerabilities.",
            "Card personalisation solutions, brought to you by Altron TMT (Pty) Ltd, through its ACS Division, in partnership with Entrust Datacard.",
            "offers cost-effective solutions for installation and maintenance with our 24/7 contact centre all year round.",
            "Deliver a seamless omnichannel payment processing experience.",
            "Tomorrow's solution for today's public transport needs."
    };
    @Override
    public int getCount() {
        return splash_headings.length;
    }

    @Override
    public boolean isViewFromObject(View view, @NonNull Object o) {
        return view == (RelativeLayout) o;
    }

    @Override
    public Object instantiateItem(ViewGroup container, int position) {
        layoutInflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);
        View view= layoutInflater.inflate(R.layout.splash_layout, container, false);

        ImageView  splashImage= (ImageView) view.findViewById(R.id.splash_imageView);
        TextView txtHeading= (TextView) view.findViewById(R.id.slide_heading);
        TextView txtDecription= (TextView) view.findViewById(R.id.slide_description);

        splashImage.setImageResource(splash_images[position]);
        txtHeading.setText(splash_headings[position]);
        txtDecription.setText(splash_desc[position]);
        container.addView(view);

        return view;
    }


    @Override
    public void destroyItem(@NonNull ViewGroup container, int position, @NonNull Object object) {
        container.removeView((RelativeLayout) object);
    }
}
