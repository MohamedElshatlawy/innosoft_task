package com.example.appgain_task

import android.net.Uri
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
       
        GeneratedPluginRegistrant.registerWith(flutterEngine);



        super.configureFlutterEngine(flutterEngine)

       

    }

}