package com.wirii.tasendarz;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;

public class Login extends AppCompatActivity {

    List<String> store_login = new ArrayList<>();
    List<String> store_password = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        Intent intent = new Intent (Login.this, MainActivity.class);
        EditText nazwa = findViewById(R.id.login);
        EditText haslo = findViewById(R.id.password);

        String takeLogin = nazwa.getText().toString();
        String takePassword = haslo.getText().toString();
        intent.putExtra(takeLogin, takePassword);

        if (!store_login.contains(takeLogin)) {
            if (!store_password.contains(takePassword)) {
                store_login.add(takeLogin);
                store_password.add(takePassword);
            }
        }

    }
    public void loginClick(View view) {
        Intent intent = new Intent(this, MainActivity.class);
        Button logIn = findViewById(R.id.log_in);
        startActivity(intent);

        logIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Login.this, MainActivity.class);
                startActivity(intent);
            }
        });
    }
}
