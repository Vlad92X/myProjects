package com.example.dovlatovfinance;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.Nullable;
import android.app.Fragment;

/**
 * Created by Khodashka on 15.10.2020.
 */


public class TextFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.layout_text_fragment, container, false);
    }

}


