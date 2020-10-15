package com.example.dovlatovfinance;



import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

/**
 * Created by Khodashka on 15.10.2020.
 */

public class MainActivity extends Activity implements View.OnClickListener {

    private TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textView = (TextView) findViewById(R.id.resultText);

        initSecondFragment();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Fragment fragment = getFragmentManager().findFragmentById(R.id.text_fragment);
//        Button button = (Button) fragment.getView().findViewById(R.id.btn_first_fragment);
//        button.setOnClickListener(this);
    }

    private void initSecondFragment() {
        FragmentManager fm = getFragmentManager();
        FragmentTransaction ft = fm.beginTransaction();
        ft.add(R.id.calculator_fragment, new CalculatorFragment());
        ft.commit();
    }

    @Override
    public void onClick(View v) {
        textView.setText("Hello from First fragment");
    }

}



//import androidx.appcompat.app.AppCompatActivity;
//
//import android.app.FragmentManager;
//import android.app.FragmentTransaction;
//import android.os.Bundle;
//import android.widget.TextView;
//
//import com.example.dovlatovfinance.R;
//
//public class MainActivity extends AppCompatActivity {
//
//    private TextView textView;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        textView = (TextView) findViewById(R.id.result);
//
//        initСalculatorFragment();
//    }
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//    }
//
//    private void initСalculatorFragment() {
//        FragmentManager fm = getFragmentManager();
//        FragmentTransaction ft = fm.beginTransaction();
//        ft.add(R.id.layout_calculator_fragment, new СalculatorFragment());
//        ft.commit();
//    }
//}
