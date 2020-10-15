package com.example.listusers.view.activity;


//import android.databinding.DataBindingUtil;
//import android.os.Bundle;
//import android.support.v7.app.AppCompatActivity;
//
//import com.guendouz.people.R;
//import com.guendouz.people.databinding.MainActivityBinding;
//import com.guendouz.people.view.fragment.PeopleFragment;


import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;

import com.example.listusers.R;
import com.example.listusers.databinding.MainActivityBinding;
import com.example.listusers.view.fragment.PeopleFragment;

/**
 * The main activity of the app
 */
public class MainActivity extends AppCompatActivity {

    MainActivityBinding mMainActivityBinding;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d("MyLog", "Start!");
        mMainActivityBinding = DataBindingUtil.setContentView(this, R.layout.main_activity);
        if (mMainActivityBinding.toolbar != null) {
            setSupportActionBar(mMainActivityBinding.toolbar);
            mMainActivityBinding.toolbar.setTitle("People");


        }

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.fragment_content, new PeopleFragment())
                .commit();

    }
}
