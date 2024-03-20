package com.example.p12_basic_widgets

import android.content.Context
import android.media.MediaPlayer
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.VibrationEffect
import android.os.Vibrator
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    companion object {
        private const val ALARM_CHANNEL = "ALARM_CHANNEL";
        val customSoundUri = Uri.parse("android.resource://p12_basic_widgets/raw/warning.mp3")
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, ALARM_CHANNEL).setMethodCallHandler {
                call, result -> when (call.method) {
                    "setAlarm" -> {
                        setAlarm()
                        result.success(null)
                    }
        }}
    }
   private fun setAlarm() {
       playCustomAlarm(context, customSoundUri);
   }
    private fun vibrate() {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            vibrator.vibrate(VibrationEffect.createOneShot(500, VibrationEffect.DEFAULT_AMPLITUDE))
        } else {
            vibrator.vibrate(500)
        }
    }

    private fun playCustomAlarm(context: Context?, customSoundUri: Uri) {
        try {
            val mediaPlayer = MediaPlayer.create(context, customSoundUri)
            mediaPlayer.isLooping = false
            mediaPlayer.start()
            Handler().postDelayed({
                mediaPlayer.stop()
                mediaPlayer.release()
            }, 5000)
            // Optional: Setze einen OnCompletionListener, um Aktionen nach dem Abspielen des Alarms auszuführen
            mediaPlayer.setOnCompletionListener { mp ->
                // Aktionen nach dem Abspielen des Alarms
                mp.release() // Freigabe der MediaPlayer-Ressourcen
            }
        } catch (e: Exception) {
            // Fehlerbehandlung, falls das Abspielen des Alarms fehlschlägt
            e.printStackTrace()
        }
    }

}
