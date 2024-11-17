




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_Screen extends StatefulWidget {
  Notification_Screen({Key? key}) : super(key: key);

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(child: Text("No Notifications", style: GoogleFonts.lato(),),),
    );
  }
}