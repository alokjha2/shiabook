import 'package:flutter/material.dart';




// final otpInputDecoration = InputDecoration(
//   contentPadding:
//       EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

// OutlineInputBorder outlineInputBorder() {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
//     borderSide: BorderSide(color: kTextColor),
//   );
// }

// final headingStyle = TextStyle(


//   fontSize: getProportionateScreenWidth(28),
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
//   height: 1.5,
// );




final TextTheme textTheme = TextTheme(
    headline5: TextStyle(
        // fontSize: 14.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w400), //medium
    headline4: TextStyle(
        // fontSize: 14.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w700), //semi-bold
    headline3: TextStyle(
        // fontSize: 18.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w600), //semi-bold
    headline2: TextStyle(
        // fontSize: 18.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w700), //bold
    headline1: TextStyle(
        // fontSize: 22.sp, color: primaryTextDark,
         fontWeight: FontWeight.w700),
    bodyText1: TextStyle(
        // fontSize: 14.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w400), //regular/normal/plain
    bodyText2: TextStyle(
        // fontSize: 16.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w400), //medium
    overline: TextStyle(
        // fontSize: 14.sp,
        // color: secondaryTextDark,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    button: TextStyle(
        // fontSize: 12.sp,
        // color: white,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5),
    subtitle1: TextStyle(
        // fontSize: 14.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w600), //semibold
    subtitle2: TextStyle(
        // fontSize: 16.sp,
        // color: primaryTextDark,
        fontWeight: FontWeight.w600), //semibold
    caption: TextStyle(
        // fontSize: 12.sp,
        // color: secondaryTextDark,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5));
