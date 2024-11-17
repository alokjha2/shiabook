// explore page (bottom bar)




import 'package:alok/Widgets/all_books.dart';
import 'package:alok/Widgets/card.dart';
import 'package:alok/Widgets/slider/custom_slider.dart';
import 'package:alok/constants/image.dart';
import 'package:alok/screens/all_book_paginated.dart';
import 'package:alok/screens/featured.dart';
import 'package:alok/Widgets/exploreCategory.dart';
import 'package:alok/Widgets/featuredBook.dart';
import 'package:alok/Widgets/allBooks.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class body extends StatefulWidget {
  body({Key? key}) : super(key: key);
  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  final box = SizedBox(height: 16,);
  final box1 = SizedBox(height: 8,);
  final ScrollController page = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 2),
      child: 
      // HomeBanner()
      
      
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselExample(),
          // HomeBanner(),
          box,
      
      
          Text("Category", style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),
          box1,
          category(page: page),
          box,
      
          // featured books
          title(text: "Featured Books", onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: featured()));}),
          box1,
          featuredbook(),
          box,
          
      
          // all books
          title(text: "All Books", onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AllBooks()));}),
          box1,
          Allbook(),
          box,
        ],
          ),
      )
  );
}
Widget getSlider(){
  // return CustomSlider(items: ["assets/ads_1.jpeg",]);
  return CustomSlider(items: [bg, bg1,]);
}

Widget title({required text,required onTap}) => 
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.end,
  children: [
      Text(text, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),

      InkWell(
        onTap: onTap,
        child: Text('See All',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.orange))))
    ],
  );
}