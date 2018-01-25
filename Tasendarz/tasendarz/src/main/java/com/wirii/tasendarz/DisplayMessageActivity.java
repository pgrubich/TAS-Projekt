package com.wirii.tasendarz;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


public class DisplayMessageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_message);

        //Intent intent = getIntent();
        // tu było to, co jest teraz w onclick AddEvent
        //String calDate = intent.getStringExtra(CalendarActivity.calDate);
        TextView current_event = findViewById(R.id.store_message);
        for (int i = 0; CalendarActivity.ondate.size() > i; i++)
            current_event.setText(String.format("%s%s%s, ", ": " ,current_event.getText(), CalendarActivity.ondate.get(i)));
    }
    public void goBack(View view) {
        Intent intent = new Intent(this, MainActivity.class);
        Button goBack = findViewById(R.id.go_back);
        startActivity(intent);

        goBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(DisplayMessageActivity.this, MainActivity.class);
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
