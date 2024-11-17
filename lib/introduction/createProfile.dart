




import 'dart:io';
import 'package:alok/bottomBar/explore.dart';
import 'package:alok/constants/colors.dart';
import 'package:alok/create_profile/body.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/home.dart';
import 'package:alok/introduction/phone_Auth/intl_phone_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class createProfile extends StatefulWidget {
  createProfile({Key? key}) : super(key: key);
  @override
  State<createProfile> createState() => _createProfileState();
}

class _createProfileState extends State<createProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController description= TextEditingController();
  // final s1 = SizedBox(height: 20,);
  // final s2 = SizedBox(height: 16,);
  // bool _isObscure = true;
  // final user = FirebaseAuth.instance.currentUser!;
  // bool isuploading = false;
  // firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  // File? _photo;
  // // final ImagePicker _picker = ImagePicker();
  // bool error = false;
  // final ScrollController page = ScrollController();
  // late String imgurl = "";
  // final TextEditingController city = TextEditingController();
  // bool? _success;
  // String? _userEmail;
  @override
  Widget build(BuildContext context) {
  // final TextEditingController name = TextEditingController(text:
  // user.displayName==null?"":
  //  user.displayName!);
  // final TextEditingController phone = TextEditingController(text:
  // user.phoneNumber==null?"":
  //  user.phoneNumber);
  // final TextEditingController _emailController = TextEditingController(text:
  // user.email==null?"":
  //  user.email);
    return Scaffold(
      // scaffoldBackgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white10,
    elevation: 0,
    // brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    // textTheme: TextTheme(
    //   headline6: TextStyle(
    //     color: Color(0xFF8b8b8b),
    //     fontSize: 18,
    //   ),
    // ),
        
      ),
      body: Body()
    // body: Padding(
    //   padding: const EdgeInsets.only(left: 30, right: 30),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,

    //     children: <Widget>[

    //       s1,
    //       user.photoURL==null?
    //       const CircleAvatar(

    //         backgroundImage: AssetImage("assets/profile.png"),
    //       radius: 60,backgroundColor: Colors.lightBlue,)
    //       :
    //       CircleAvatar(

    //         backgroundImage: NetworkImage(user.photoURL!),
    //       radius: 60,backgroundColor: Colors.lightBlue,),
    //       // s1,
    //       s1,
    //       field(controllerName: name, hinttext: "Profile's Name", error: "Name"), 

    //       s2,
    //       field(controllerName: _emailController, hinttext: "Email", error: "Email"), 

    //       s2,
    //       IntlPhoneField(
    //               decoration: InputDecoration(
    //                 labelText: 'Phone Number',
    //                 border: OutlineInputBorder(
    //                   borderSide: BorderSide(),
    //                 ),
    //               ),
    //               onChanged: (phone) {
    //                 print(phone.completeNumber);
    //               },
    //               onCountryChanged: (country) {
    //                 print('Country changed to: ' + country.name);
    //               },
    //             ),
                
    //       // field(controllerName: phone, hinttext: "Phone Number", error: "Phone"), 

    //       s2,
    //       field(controllerName: city, hinttext: "City", error: "City"), 



    //       s1,
    //         InkWell(
    //           onTap: (){
    //             print(user.uid);
    //             createProfilePage(context: context, uid: user.uid, name: name, phone: phone.text, email: _emailController.text);
                    
    //           },
    //           child: Container(
    //                   decoration : const BoxDecoration(
    //                     color: Colors.orange,
    //                     ),
    //                     width: 300,
    //                     child: TextButton(
    //               child: Text("Create profile", style:GoogleFonts.lato(textStyle:  TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),)),
    //               onPressed: (){
    //                 print(user.uid);
    //                     createProfilePage(context: context, uid: user.uid, name: name, phone: phone.text, email: _emailController.text);
    //                  })),
    //         ),
    //             s2,
        
          
    //             ],
    //           ),
            // ),
          );
        }




// createProfilePage({required BuildContext context, required uid, required name, required phone, required email})async{
//   final userData = FirebaseFirestore.instance.collection("userData").doc("${user.uid}");

  
//   await userData.set({
//     "name" : name.text,
//     "uid" : user.uid,
//     "email" : email,
//     "phone number" : "+91 $phone",
//     "city" : city.text
//   }).then((value) {          
//     message(message: "Profile created");
//     Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child : MainPage()));
//     }).onError((error, stackTrace) => message(message: "error while creating profile"));
    

// }

// Widget field({required controllerName, required hinttext, required error,})=>
// TextFormField(
//   controller: controllerName,
//   decoration: InputDecoration(
//   hintText: hinttext,
  
//     enabledBorder:const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//     ),
//     focusedBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//     ),
//   filled: true,
//   fillColor: Colors.grey[100],
// ),

//   );            
}