


import 'package:alok/bottomBar/explore.dart';
import 'package:alok/constants/image.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/home.dart';
import 'package:alok/introduction/createProfile.dart';
import 'package:alok/introduction/phone_Auth/otp/body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class verify extends StatefulWidget {
  final String number;
  verify({Key? key, required this.number}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  // final CustomTimerController _controller = CustomTimerController();
  var _status = waiting;
  static var waiting;
  var verificationId1;
  late var code = "";
  final TextEditingController number1 = TextEditingController();


@override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // verifyNumber();
    // _controller.start();
    super.initState();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

//   Widget timer()=>CustomTimer(
//   controller: _controller,
//   begin: Duration(days: 1),
//   end: Duration(),
//   builder: (time) {
//     return 
//     Text(
//       "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
//       style: TextStyle(fontSize: 24.0)
//     );
//   }
// );

  Future verifyNumber()async{
    _auth.verifyPhoneNumber(phoneNumber: "${widget.number}", verificationCompleted: (PhoneAuthCredential)async{
      _sendCodeToFirebase();
    },
     verificationFailed: (PhoneVerificationFailed)async{
      message(message: "Invalid number");
     }, codeSent:
      (verificationId, forceResendingToken) async{
      setState(() {
        verificationId1 = verificationId;
        this.code = verificationId;
      });
     }, codeAutoRetrievalTimeout: (verificationId)async{
      }
    );
  }

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

  Future _sendCodeToFirebase({String? code})async{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId1, smsCode: code!);
      await _auth.signInWithCredential(credential).then((value) {
        message(message: "signin successful");
        getDoc();
        }).onError((error, stackTrace) => message(message: "wrong OTP"));
    }
  @override
  Widget build(BuildContext context) {
         return Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(title: Text("OTP verification"),),
      body: 
      //  Body("")
      
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                
                height: 400,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage(otp))),),
                  RichText(
              text:  TextSpan(
              children: [
                TextSpan(
                  style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.black,fontSize: 20),),
                  text: "OTP sent to ",
                ),
                TextSpan(
                  style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.lightBlue,fontSize: 20),),
                  text: "${widget.number}",
        
                ),
              ]
            )
          ),
              // Text("wait for some minutes"),
            //  Text(widget.number == null?"":"OTP sent to +91 ${widget.number}"),
             SizedBox(height: 4,),

        //      CustomTimer(
        //   controller: _controller,
        //   // onBuildAction: CustomTimerAction.auto_start,
        //   begin: Duration(minutes: 5),
        //   end: Duration(),
        //   builder: (CustomTimerRemainingTime time) {
        //     return Row(
        //       children: [
        //         RichText(
        //       text:  TextSpan(
        //       children: [
        //         TextSpan(
        //           style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.black,fontSize: 20),),
        //           text: "You will recieve otp in ",
        //         ),
        //         TextSpan(
        //           style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.lightBlue,fontSize: 20),),
        //           text: 
        //           // "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
        //           "${time.minutes}:${time.seconds}",
        //           // style: TextStyle(fontSize: 24.0)
        //         // ),
        
        //         ),
        //       ]
        //     )
        //   ),
                
        //       ],
        //     );
        //   }
        // ),
        
             SizedBox(height: 20,),
             
             PinCodeTextField(
              keyboardType: TextInputType.number,
              focusNode: FocusNode(),
              obscureText: true,
              // autofocus: true,
              // textAlign: TextAlign.center,
              
              
              textInputAction: TextInputAction.send,
          length: 6,
          // obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            selectedFillColor: Colors.white,
            
            activeFillColor: Colors.white,
            inactiveColor: Colors.black,
            inactiveFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          // backgroundColor: Colors.blue.shade50,
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          // errorAnimationController: errorController,
          // controller: textEditingController,
          onCompleted: (v) {
            // _controller.pause();
            print(v);
            _sendCodeToFirebase(code: v.toString());
          },
          onChanged: (value) {
          },
          beforeTextPaste: (text) {
            return true;
          }, appContext: context,
        ),
            
             SizedBox(height: 20,),
            ],
          ),
        ),
      ) 
    );
  }
}