import 'package:alok/Appbar/search.dart';
import 'package:alok/Appbar/searchResult.dart';
import 'package:alok/Drawer/drawer.dart';

import 'package:alok/bottomBar/explore.dart';
import 'package:alok/constants/colors.dart';
import 'package:alok/helpers/exit_app.dart';
import 'package:alok/introduction/createProfile.dart';
// import 'package:alok/screens/bookmark.dart';
import 'package:alok/screens/notification_screen.dart';
import 'package:alok/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:alok/introduction/signpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:alok/screens/bookmark.dart';





class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MainPageState();
  }
}


class MainPageState extends State<MainPage>{
  // MainPage();
  static const routeName = '/MainPage';
  final Stream <QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Book').snapshots();
  int pageIndex = 0;
  Future getDoc() async{
  final user = FirebaseAuth.instance.currentUser!;
   var a = await FirebaseFirestore.instance.collection('userData').doc(user.uid).get();
   if(a.exists){
    }

   if(!a.exists){
     await Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: createProfile()));
     }
  }

  @override
  void initState() {
    getDoc();
    super.initState();
  }

  
  final pages = [
    body(),
    bottom_Bookmark(),
    ]  ;

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () { 
        return showExitDialog(context); },
          child: Scaffold(
            appBar: 
              PreferredSize(
                preferredSize:  Size(MediaQuery.of(context).size.width, AppBar().preferredSize.height+80 ),
                child: Stack(
                  children: <Widget>[
                    Container(     // Background
                      child: Center(
                        child: Text("Shia Books", style:GoogleFonts.lato(textStyle: TextStyle(fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),),),),
                      color: orange,
                      height: AppBar().preferredSize.height+65,
                      width: MediaQuery.of(context).size.width,
                    ),


                    Container(),

                    Positioned(
                      top: 90.0,
                      left: 20.0,
                      right: 20.0,
                      child: InkWell(
                        splashColor: grey,
                          onTap: (){
                              showSearch(context: context, delegate: UserSearch());
                            },

                        child: AppBar(
                          elevation: 5,
                          backgroundColor: Colors.white,
                          leading:Builder(builder: (context) => 
                          IconButton(
                            icon: 
                          Icon(Icons.menu, 
                            color: Colors.orange,),onPressed: ()=>
                            Scaffold.of(context).openDrawer()
                          ),),
                          primary: false,
                          title: InkWell(
                            splashColor: grey,
                            // onTap: (){
                            //   showSearch(context: context, delegate: DataSearch());
                                          
                            // },
                            child: Container(child: Text(
                              // "Search", 
                              "", 
                              ),)
                            
                            ),
                          actions: <Widget>[


                            IconButton(
                              color: orange,
                              onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Notification_Screen()));

                            }, icon: Icon(Icons.notifications)),
                          PopupMenuButton<int>(
                            // color: Colors.orange,
                            icon: Icon(Icons.more_vert_rounded, color: Colors.orange,),
                            onSelected: (item)=> onSelected(context, item),
                            itemBuilder: (context) => [
                              PopupMenuItem(child: Row(
                                children: [
                                Icon(Icons.share,
                                color: Colors.orange,
                                ),
                                SizedBox(width: 8,),
                                Text("Share")
                                ]
                                ),
                                value: 1,
                              ),
                              
                              //Signout
                            PopupMenuDivider(height: 2,),
                                  // Divider(height: 2,),
                                  PopupMenuItem(
                                    child: Row(children: [
                                      Icon(Icons.logout, 
                                      color: Colors.orange,
                                      ),
                                      SizedBox(width: 8,),
                        
                                    Text("Sign out",style: 
                                    // displayLarge,
                                    GoogleFonts.ubuntu(textStyle: TextStyle(fontWeight: FontWeight.w400)
                                    )),],),
                                    
                                    
                                  value: 3,
                                  )
                                ])
                        
                                ],
                              ),
                      ),
                          )

      ],
    ),
  ),
      bottomNavigationBar: Container(
        
          decoration: const BoxDecoration(),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
            currentIndex: pageIndex,
            selectedItemColor: Colors.deepOrange,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                label: 'Bookmark',
              ),
              ],
          ),
        ),
        
           body : 
           pages[pageIndex],
            
          drawer: Drawere(),
        ),
    );
    }

      void onSelected(BuildContext context, int item, ){
        switch (item){
             
          // share button      
          case 1:
          
          Share.share("Hey,I just wanted to share my favorite app with you. It's called Shia Books and it's available on Play Store. I've been using it and I love it because this app have great features along with great books. You can download it from the play store using this link: https://play.google.com/store/apps/details?id=com.gigls.audiobook You can consume lot of Shia Books in audio as well as Pdf format. Let me know what you think about this app!");
            break;


            

            case 3:
              logout();
            break;
        }
      }

void logout(){
  showDialog(
    context: context,
    builder: (BuildContext context) => 
      AlertDialog(
        content:const Text("Are you sure you want to Logout ??"),        
            actions: [
              CupertinoDialogAction(
                child: const Text("no"),
                onPressed: (){
                  Navigator.of(context).pop();
                }
              ),

              CupertinoDialogAction(
                child: const Text("yes"),
                onPressed: (){
                  Navigator.of(context).pop();
                  googleSignOut(context);
                    }
                  ),
                ],
              )
      );
    }
  Future googleSignOut(BuildContext context) async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut().then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Signup()));
      }
    );
  }
}

