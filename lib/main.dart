import 'dart:async';

import 'package:alok/constants/colors.dart';
import 'package:alok/create_profile/complete_profile_form.dart';
import 'package:alok/home.dart';
import 'package:alok/introduction/createProfile.dart';
import 'package:alok/introduction/phone_Auth/otp/otp_form.dart';
import 'package:alok/introduction/phone_Auth/otpVerify.dart';
import 'package:alok/introduction/signpage.dart';
import 'package:alok/just_audio_background.dart';
import 'package:alok/size_config.dart';
import 'package:alok/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


int? isviewed;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
    );
    runApp(MyApp());
}


class MyApp extends StatefulWidget{
  @override 
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: TextTheme(
        headline1: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 18, color: Colors.black))),
        appBarTheme : AppBarTheme(
          color: grey,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black), titleTextStyle: 
          GoogleFonts.lato(textStyle: 
          TextStyle(color: black,fontSize: 22, fontWeight: FontWeight.w400)))),
    title: "Shia Books",
    debugShowCheckedModeBanner: false, 
    home : 
    FirebaseAuth.instance.currentUser != null ?  MainPage() : Signup()
    );
  }
}