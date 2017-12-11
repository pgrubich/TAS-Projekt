package com.wirii.tasendarz;

import android.content.Intent;
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

        Intent intent = getIntent();
        String display = intent.getStringExtra(AddEvent.EXTRA_MESSAGE);
        TextView message = findViewById(R.id.add_event);
        message.setText(display);
        startActivity(intent);

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
}
