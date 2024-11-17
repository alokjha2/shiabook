




// +91 9456600955

import 'package:alok/constants/colors.dart';
import 'package:alok/constants/image.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/introduction/phone_Auth/fade_animation.dart';
import 'package:alok/introduction/phone_Auth/intl_phone_field.dart';
import 'package:alok/introduction/phone_Auth/otpVerify.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class setNumber extends StatefulWidget {
  setNumber({Key? key}) : super(key: key);

  @override
  State<setNumber> createState() => _setNumberState();
}

class _setNumberState extends State<setNumber> {
  final TextEditingController number = TextEditingController();
  final code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,

	              decoration: BoxDecoration(
                  image: DecorationImage(
	                  image: 
                    AssetImage("assets/images/loginbackground.png"),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-1.png')
	                        )
	                      ),
	                    )
                      ),

	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/images/light-2.png')
	                        )
	                      ),
	                    )),
	                  // ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(                            
	                          image: AssetImage('assets/images/clock.png', )
	                        )
	                      ),
	                    )
                    ),

	                  Positioned(
	                    child: Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )
                    ),  
	                ],
	              ),
	            ),

	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Container(
	                      child: IntlPhoneField(
                          validator: (p0) {
                            
                          },
                              
            onSubmitted: (p0) {
              print("Your number is $p0 and code is $code");
              // Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: verify(
              //             number: number.text+p0,
              //           )));

            },
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) { 
                    setState(() {
                    final code = country.code;
                      
                    });
                    print('Country changed to: ' + country.name);
                  },
                ),
	                    ),
	                  ),
                    // ),
	                  // SizedBox(height: 30,),
                    // //  InkWell(
                    // //   onTap: (){

                    // //   },
                    //    child: Container(
                    //                       height: 50,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius: BorderRadius.circular(10),
                    //                         gradient: LinearGradient(
                    //                           colors: [
                    //           Colors.orange.shade700,
                    //           Colors.orange.shade500,
                    //           Colors.orange.shade400,
                    //           Colors.orange.shade300,
                    //           Colors.orange.shade200,
                    //                           ]
                    //                         )
                    //                       ),
                    //                       child: Center(
                    //                         child: Text("Verify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),),
                    //                       ),
                    //                      ),
                    //  ),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );    
  }
}