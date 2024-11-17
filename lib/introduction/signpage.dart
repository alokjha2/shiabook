import 'package:alok/constants/image.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/introduction/createProfile.dart';
import 'package:alok/introduction/phone_Auth/setNumber.dart';
import 'package:alok/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:alok/home.dart';
import 'package:page_transition/page_transition.dart';


class Signup extends StatefulWidget{


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late AuthCredential credential;

  bool loading =false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white38,
      systemNavigationBarIconBrightness: Brightness.light,
      ));
  
  }

  @override
  Widget build(BuildContext context){
    
    // SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(
                height: 75,
              ),

              Container(
                width: double.infinity,
                height: 400,
                  padding: const EdgeInsets.fromLTRB(2, 40, 2, 6),
                  decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(45),
                          topEnd: Radius.circular(45))),
                  child: signInModal(context)),
            ],
          ),
        ));
  }

  Column signInModal(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [

              TextSpan(
                text: "Welcome",
                style: GoogleFonts.ubuntu(
                  textStyle:  const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w500
                    ))),

                            
              TextSpan(
                text: "\n         To ",
                style : GoogleFonts.ubuntu(
                textStyle:  const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500))),


              TextSpan(
                text: "\n Shia ",
                style : GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                  color: Colors.orange,
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                  ))),


              TextSpan(
                text: "Books",
                style : GoogleFonts.ubuntu(
                textStyle:  const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600)))
                  
                  
                  ])),
        
        const SizedBox(height: 40,),
        InkWell(
          onTap: (){
                        setState(() {
                          loading==true;
                        });
                        googleSignIn();
            
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.orange),
            // color: Colors.green,
                    width: 300,
                    child: 
                    
                    TextButton.icon(
                      icon: Image.asset(google, height: 30,width: 30,),
                      label: Text("Continue with google",style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.white,fontSize: 20),),),
                      onPressed: ()=>
                    googleSignIn().onError((error, stackTrace) {
                      print("error ${error.toString()}", );
                      message(message: "Sorry unsuccessful");}))
                  ),
        ),
        // SizedBox(height: 10,),
        // InkWell(
        //   onTap: (){
        //               Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: setNumber()));
            
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.orange),
        //     // color: Colors.green,
        //             width: 300,
        //             child: 
                    
        //             TextButton.icon(
        //               icon: Image.asset(phone, height: 30,width: 30,),
        //               label: Text("Continue with Phone",style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.white,fontSize: 20),),),
        //               onPressed: ()=>
        //               Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: setNumber()))
        //             ),
        //           ),
        // ),




        const SizedBox(height: 30,),


        RichText(
          text:  TextSpan(
            children: [
              TextSpan(
                style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.grey,fontSize: 16),),
                text: "       By Continuing You Agree To Our",
              ),
              
              TextSpan(
                style: GoogleFonts.ubuntu(textStyle:const  TextStyle(color: Colors.blueAccent,fontSize: 18),),
                text: "\n Terms of Services",
                recognizer:  TapGestureRecognizer()..onTap = () {
                  // _launchURL();
                  },
              ),

              TextSpan(
                style: GoogleFonts.ubuntu(textStyle:  const TextStyle(color: Colors.grey,fontSize: 16),),
                 text: " & ",
              ),

              TextSpan(
                style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.blue,fontSize: 18),),
                 text: "Privacy Policy",
                 recognizer:  TapGestureRecognizer()..onTap = () {
                  // policy();

                },
              ),
            ]
          )
        ),
      ],
    );
  }


// logic for signup 
Future googleSignIn() async{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();


  var _authentication = await _googleSignInAccount?.authentication;

  var _credential = GoogleAuthProvider.credential(
    idToken: _authentication!.idToken,
    accessToken: _authentication.accessToken
  );
  User user = (await _auth.signInWithCredential(_credential)).user!;
  String uid = user.uid;
  getDoc();
  return user;
}


// signout
Future getDoc() async{
  final user = FirebaseAuth.instance.currentUser!;
   var a = await FirebaseFirestore.instance.collection('userData').doc(user.uid).get();
   if(a.exists){
      message(message: "Profile fetched");
     await Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MainPage()));

      }

   if(!a.exists){
     await Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: createProfile()));
     }
  }
Future googleSignOut(BuildContext context) async{
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  await _googleSignIn.signOut().then((value) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> 
    Signup()));
  });
}

}