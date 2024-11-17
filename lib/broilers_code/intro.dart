// // introduction screens



// import 'package:alok/home.dart';
// import 'package:alok/introduction/signpage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:alok/main.dart';
// import '../main.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class OnBoardpage extends StatefulWidget {


//   @override
//  State<OnBoardpage> createState(){
//    return OnBoardpageState();
//  }
// }

// class OnBoardpageState extends State<OnBoardpage> {
//   int currentIndex = 0;
//   late PageController _pageController;
//   @override
//   void initState() {
//     _pageController = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   _storeOnboardInfo() async {
//     print("Shared pref called");
//     int isViewed = 0;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('onBoard', isViewed);
//     print(prefs.getInt('onBoard'));
//   }






//   @override
//   Widget build(BuildContext context){
//     return SafeArea(
//       child: IntroductionScreen(
        
//         showNextButton: true,
//         showSkipButton: true,
//         skip: Text("Skip", style:
//         GoogleFonts.ubuntu(textStyle: 
      
//          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),),
//         next: Icon(Icons.arrow_forward, size: 25,),
//         globalBackgroundColor: Colors.white,
//         isProgress: true, // hide bubble
//         freeze: true,// can't swipe in both direction
//         skipColor: Colors.red,  
//         doneColor: Colors.green,  
//         nextColor: Colors.blue,
//         dotsDecorator: DotsDecorator(
//         activeColor: Colors.blue,
//         color: Color(0xFFBDBDBD),
//         size: Size(8,8),
//         spacing: const EdgeInsets.symmetric(horizontal: 3.0),
//         activeSize: Size(8,8),
       
//   ),
//       pages: [




        
//         intro1(title: "Listen to unlimited AudioBook", body: "It's Free", image: "assets/listenbook.png"),
//         intro1(title: "Improve yourself with Self Help Books", body: "Our platform is addictive", image: "assets/2.png"),
//         intro1(title: "Browse Audiobooks", body: "Search your favourite Audiobooks", image: "assets/goodsearch.png"),
//         intro1(title: "Comment down your thoughts under your favourite Audiobooks !", body: "very interesting feature!", image: "assets/good_comment.png"),
//         intro1(title: "Use app in dark mode also", body: "Dark mode is available", image: "assets/dark_mode.png"),
//         intro1(title: "Download Audiobooks to listen it later!", body: "Upcoming feature", image: "assets/download.png"),
//         intro1(title: "Welcome to The Better You !", body: "By Pasternak.co", image: "assets/logo.png"),
//       ],
      
      
//       done: Text(
//         "Let's Go!", 
//         style: 
//         GoogleFonts.ubuntu(textStyle: 
        
        
//         TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
//         ),
//       onDone: (){
//         _storeOnboardInfo();
//         goToHome(context);
//       },
//     )
//   );
// }
//   PageViewModel intro1({required title, required body, required image,}) => PageViewModel(
//         title: title,
//         body: body,
//         image: Center(child: Image.asset(image, width: 250,)),
//         decoration: PageDecoration(
//         titleTextStyle: GoogleFonts.ubuntu(textStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
//         bodyTextStyle: GoogleFonts.ubuntu(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,
//         color: Colors.black
//            ),)
//       ),   
//     );


// void goToHome(context) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Signup()));

// Widget buildImage(String path) =>
//   Center(
//     child: 
    
//     Image.asset(path, width: 250,),
    
   
    
//     );
 
// }
  
  
  
  
  
  
  
  

 
