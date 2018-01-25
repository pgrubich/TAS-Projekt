/**
 * Created by Wirii on 2017-12-08.
 */
package com.wirii.tasendarz;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.CalendarView;

import java.util.ArrayList;
import java.util.List;


public class CalendarActivity extends AppCompatActivity {

    private static final String TAG = "CalendarActivity";
    public static String calDate = "date";
    public static final String MyPREFERENCES = "DateData";
    SharedPreferences sharedpreferences;
    static List<String> ondate = new ArrayList<>();

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.calendar_layout);
        sharedpreferences = getSharedPreferences(MyPREFERENCES, Context.MODE_PRIVATE);
        final CalendarView mCalendarView = findViewById(R.id.calendarView);
        mCalendarView.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
            @Override
            public void onSelectedDayChange(@NonNull CalendarView CalendarView, int year, int month, int dayOfMonth) {
                String date = year + "/" + month + "/"+ dayOfMonth ;
                Log.d(TAG, "onSelectedDayChange: yyyy/mm/dd:" + date);
                Intent intent = new Intent(CalendarActivity.this, AddEvent.class);
                intent.putExtra("date", date);
                //intent.putExtra(calDate, date);
                long getDate = mCalendarView.getDate();
                SharedPreferences.Editor editor = sharedpreferences.edit();
                editor.putLong(calDate, getDate);
                editor.apply();

                startActivity(intent);
            }
        });
    }
}