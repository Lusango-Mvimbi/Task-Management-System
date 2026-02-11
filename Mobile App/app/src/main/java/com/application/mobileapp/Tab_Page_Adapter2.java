package com.application.mobileapp;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentStatePagerAdapter;

import java.util.ArrayList;
import java.util.List;

public class Tab_Page_Adapter2 extends FragmentStatePagerAdapter {

    int numbTabs;
    public Tab_Page_Adapter2 (FragmentManager manager, int numberTabs){
        super(manager);

        this.numbTabs= numberTabs;
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new ITS();

            case 1:
                return new CyberTech();

            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return numbTabs;
    }
}
