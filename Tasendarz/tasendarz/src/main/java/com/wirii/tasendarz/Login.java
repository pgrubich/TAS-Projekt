package com.wirii.tasendarz;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.content.SharedPreferences;
import android.content.Context;

//import java.util.ArrayList;
//import java.util.List;

public class Login extends AppCompatActivity {

    //List<String> store_login = new ArrayList<>();
    //List<String> store_password = new ArrayList<>();
    public static final String MyPREFERENCES = "LoginInfo";
    public static final String login = "login";
    public static final String password = "password";
    SharedPreferences sharedpreferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        final EditText nazwa = findViewById(R.id.login);
        final EditText haslo = findViewById(R.id.password);
        sharedpreferences = getSharedPreferences(MyPREFERENCES, Context.MODE_PRIVATE);

        Button logIn = findViewById(R.id.log_in);
        logIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String takeLogin = nazwa.getText().toString();
                String takePassword = haslo.getText().toString();
                SharedPreferences.Editor editor = sharedpreferences.edit();
                editor.putString(login, takeLogin);
                editor.putString(password, takePassword);
                editor.apply();

                Intent intent = new Intent(Login.this, MainActivity.class);
                startActivity(intent);
            }
        });
        //intent.putExtra(takeLogin, takePassword);

        //if (!store_login.contains(takeLogin)) {
        //    if (!store_password.contains(takePassword)) {
        //        store_login.add(takeLogin);
        //        store_password.add(takePassword);
        //    }
        }
}
