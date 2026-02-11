package com.application.mobileapp;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

public class Tab_Page_Adapter extends FragmentStatePagerAdapter {

    int numbTabs;
    public Tab_Page_Adapter(FragmentManager manager, int numberTabs){
        super(manager);

        this.numbTabs= numberTabs;
    }

    @Override
    public Fragment getItem(int position) {
        switch (position) {
            case 0:
                return new New_Task();

            case 1:
                return new Urgent_Task();

            case 2:
                return new Normal_Task();

            case 3:
                return new Low_Task();
            case 4:
                return new Review_Task();

            default:
                return null;
        }
    }

    @Override
    public int getCount() {
        return numbTabs;
    }
}
