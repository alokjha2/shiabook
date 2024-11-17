


import 'package:alok/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({required this.iconPath});

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(

        10,
        10,
        10,
        10
        ),
      child: SvgPicture.asset(
        iconPath,
        height: 2,
        width: 3,
      ),
    );
  }
}
