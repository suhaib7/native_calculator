package com.example.native_calculator

import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {

    private val channelName = "result";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName);
        channel.setMethodCallHandler { call, result ->
            if (call.method == "getAdditionResult") {
                val num1 = call.argument<String>("num1")?.toInt() ?: 0
                val num2 = call.argument<String>("num2")?.toInt() ?: 0
                val sum = num1 + num2
                result.success(sum.toString())
            }

            if (call.method == "getSubtractionResult") {
                val num1 = call.argument<String>("num1")?.toInt() ?: 0
                val num2 = call.argument<String>("num2")?.toInt() ?: 0
                val sum = num1 - num2
                result.success(sum.toString());
            }

            if (call.method == "getMultiplicationResult") {
                val num1 = call.argument<String>("num1")?.toInt() ?: 0
                val num2 = call.argument<String>("num2")?.toInt() ?: 0
                val sum = num1 * num2
                result.success(sum.toString());
            }

            if (call.method == "getDivisionResult") {
                val num1 = call.argument<String>("num1")?.toDouble() ?: 0.0
                val num2 = call.argument<String>("num2")?.toDouble() ?: 0.0
                if (num1 > 0 && num2 <= 0) {
                    val sum = "Cant divide by 0";
                    result.success(sum);
                }
                val sum = num1 / num2
                result.success(sum.toString());
            }

        }

    }
}
