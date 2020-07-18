package com.example.listusers.view.activity;


import android.os.Build;
import android.os.Bundle;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.fragment.app.Fragment;

import com.example.listusers.R;
import com.example.listusers.databinding.MainActivityBinding;

/**
 * The main activity of the app
 */
public class MainActivity extends AppCompatActivity {

    MainActivityBinding mMainActivityBinding;

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        mMainActivityBinding = DataBindingUtil.setContentView(this, R.layout.main_activity);
        if (mMainActivityBinding.toolbar != null) {
            setSupportActionBar(mMainActivityBinding.toolbar);
            mMainActivityBinding.toolbar.setTitle("People");
        }

        getSupportFragmentManager().beginTransaction()
                .replace(R.id.fragment_content, new Fragment())// new PeopleFragment())
                .commit();
    }
}
