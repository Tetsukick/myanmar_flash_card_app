package com.tetsukick.myanmar.frash.card.jp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

import SplashView

class MainActivity: FlutterActivity() {
    override fun provideSplashScreen(): SplashScreen? = SplashView()
}
