package com.wirii.tasendarz;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

//import java.util.ArrayList;
//import java.util.List;



public class AddEvent extends AppCompatActivity {

    public static final String EXTRA_MESSAGE = "com.wirii.tasendarz";
    //static List<String> store_events = new ArrayList<>();
    public static final String dateData = "date data";
    public static final String MyPREFERENCES = "dataInfo";
    SharedPreferences sharedpreferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_event);
        sharedpreferences = getSharedPreferences(MyPREFERENCES, Context.MODE_PRIVATE);
    }
    public void addEvent(View view) {
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        EditText addEvent = findViewById(R.id.add_event);
        String message = addEvent.getText().toString();
        SharedPreferences.Editor editor = sharedpreferences.edit();
        editor.putString(dateData, message);
        editor.apply();
        //intent.putExtra(EXTRA_MESSAGE, message);
        startActivity(intent);
        //CalendarActivity.ondate.add(message);

        Button enterEvent = findViewById(R.id.enter_event);

        enterEvent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SharedPreferences getdisplay = getSharedPreferences(AddEvent.dateData, MODE_PRIVATE);
                String display = getdisplay.getString(AddEvent.dateData, null);
                TextView message = findViewById(R.id.display_event);
                message.setText(display);
                Intent intent = new Intent(AddEvent.this, DisplayMessageActivity.class);
                startActivity(intent);
            }
        });
    }
    public void logout(View view) {
        SharedPreferences sharedpreferences = getSharedPreferences(Login.MyPREFERENCES, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedpreferences.edit();
        editor.clear();
        editor.apply();
        Intent intent = new Intent(this, Login.class);
        startActivity(intent);
    }
}
