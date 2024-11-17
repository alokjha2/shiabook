





import 'package:alok/components/default_button.dart';
import 'package:alok/constants/colors.dart';
import 'package:alok/helpers/custom_suffix_icon.dart';
import 'package:alok/helpers/errors.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../helpers/size_config.dart';
import '../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<CompleteProfileForm> {
  
  final _formKey = GlobalKey<FormState>();
  // late String firstName, lastName, phone, address;
  final List<String> errors = [];
  bool remember = false;
  final TextEditingController Name = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController  Phone = TextEditingController();
  final TextEditingController  Address = TextEditingController();
  bool firstSubmit = false;
  
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width/1.2,
            child: ElevatedButton(
              
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
      return Colors.orange;
    }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.red)
              )
            )
          ),
              onPressed: (){
                createProfilePage();

                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainPage()));
                
              },
              child: Text(
                "Continue",
                style: GoogleFonts.lato(fontSize: 25),
                )
              ),
          )


         ],
      ),
    );
  }

  createProfilePage()async{
  final userData = FirebaseFirestore.instance.collection("userData").doc("${user.uid}");

  
  await userData.set({
    "name" : Name.text,
    "uid" : user.uid,
    "email" : Email.text,
    "phone number" : Phone.text,
    "city" : Address.text
  }).then((value) {          
    message(message: "Profile created");
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child : MainPage()));
    }).onError((error, stackTrace) => message(message: "error while creating profile"));
    

}


  double getProportionateScreenHeight(double inputHeight) {
    final screenHeight = MediaQuery.of(context).size.height; 
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
    final screenWidth = MediaQuery.of(context).size.width; 
  // double? screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}


  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: Name,
      // onSaved: (newName) => this.firstName = newName!,
      onChanged: (name) {
        if (firstSubmit) _formKey.currentState!.validate();
      },
      validator: (name) {
        if (name!.isEmpty) {
          return kFirstNamelNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        suffixIcon: CustomSuffixIcon(iconPath: "assets/icons/User Icon.svg"),
      ),
      keyboardType: TextInputType.name,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: Email,
      // onSaved: (newName) => this.lastName = newName!,
      onChanged: (name) {
        if (firstSubmit) _formKey.currentState?.validate();
      },
      validator: (name) {
        if (name!.isEmpty) {
          return kLastNamelNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your Email",
        suffixIcon: 
        Icon(Icons.email, color: black.withOpacity(0.5),)
      ),
      keyboardType: TextInputType.name,
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      controller: Phone,
      // onSaved: (newPhone) => this.phone = newPhone!,
      onChanged: (phone) {
        if (firstSubmit) _formKey.currentState?.validate();
      },
      validator: (phone) {
        if (phone!.isEmpty) {
          return kPhoneNumberNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        suffixIcon: CustomSuffixIcon(iconPath: "assets/icons/Phone.svg"),
      ),
      keyboardType: TextInputType.phone,
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: Address,
      // onSaved: (newAddress) => this.address = newAddress!,
      onChanged: (address) {
        if (firstSubmit) _formKey.currentState?.validate();
      },
      validator: (address) {
        if (address!.isEmpty) {
          return kAddressNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "City",
        hintText: "Enter your City",
        suffixIcon:
            CustomSuffixIcon(iconPath: "assets/icons/Location point.svg"),
      ),
      keyboardType: TextInputType.streetAddress,
    );
  }
}
