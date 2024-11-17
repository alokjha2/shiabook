




import 'package:alok/constants/colors.dart';
import 'package:alok/create_profile/complete_profile_form.dart';
import 'package:alok/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
final headingStyle = GoogleFonts.lato(
  textStyle: TextStyle(
  fontSize: MediaQuery.of(context).size.width/11,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
));


// final headingStyle2 = GoogleFonts.lato(
//   textStyle: TextStyle(
//   // fontSize: MediaQuery.of(context).size.width/20,
//   fontWeight: FontWeight.w600,
//   // color: grey,
//   height: 1,
// ));
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 25
              // getProportionateScreenWidth(25)
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Complete Profile",
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Complete your profile details",
                  style: GoogleFonts.lato(color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.06),
                CompleteProfileForm(),
                SizedBox(height: screenHeight * 0.06),
                Text(
                  "By continuing you confirm that you agree\nwith our terms and conditions",
                  style: GoogleFonts.lato(color: Colors.grey.shade700, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
