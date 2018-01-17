package com.wirii.tasendarz;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;


public class AddEvent extends AppCompatActivity {

    public static final String EXTRA_MESSAGE = "com.wirii.tasendarz";
    List<String> store_events = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_event);
        //Intent intent = getIntent();
        EditText addEvent = findViewById(R.id.add_event);
        String message = addEvent.getText().toString();
        //intent.putExtra(EXTRA_MESSAGE, message);
        store_events.add(message);
        //startActivity(intent);
    }
    public void addEvent(View view) {
        Intent intent = new Intent(this, DisplayMessageActivity.class);
        Button enterEvent = findViewById(R.id.enter_event);
        startActivity(intent);

        enterEvent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(AddEvent.this, DisplayMessageActivity.class);
                startActivity(intent);
            }
        });
    }
}
