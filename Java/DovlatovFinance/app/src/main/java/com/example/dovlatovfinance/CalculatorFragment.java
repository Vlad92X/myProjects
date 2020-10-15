package com.example.dovlatovfinance;


import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

/**
 * Created by Khodashka on 15.10.2020.
 */



public class CalculatorFragment extends Fragment implements View.OnClickListener {

    private TextView textView;
    private Button button;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.layout_calculator_fragment, null);

        textView = (TextView) view.findViewById(R.id.resultText);
        button = (Button) view.findViewById(R.id.btn_calculate_fragment);
        button.setOnClickListener(this);

        return view;
    }

//    @Override
//    public void onResume() {
//        super.onResume();
//        Button activityBtn = (Button) getActivity().findViewById(R.id.btn_activity_main);
//        activityBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                textView.setText("Hello from Activity");
//            }
//        });
//    }

    @Override
    public void onClick(View v) {
        Activity activity = getActivity();
        FragmentManager fragmentManager = activity.getFragmentManager();
        Fragment fragment = fragmentManager.findFragmentById(R.id.text_fragment);
        TextView textView = (TextView) fragment.getView().findViewById(R.id.resultText);
        textView.setText("Hello from second Fragment");
    }

}
