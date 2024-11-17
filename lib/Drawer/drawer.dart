// home page of all navigation drawer




import 'package:alok/screens/contact_us.dart';
import 'package:alok/screens/featured.dart';
import 'package:alok/Drawer/showProfile.dart';
import 'package:alok/screens/bookmark.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawere extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser!;
  final style = GoogleFonts.lato();


  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAccountsDrawerHeader(
              accountName:user.displayName==null?Text(user.phoneNumber!, style: style,):  Text(user.displayName!, style: style),  
              accountEmail: user.email==null?Text("No email", style: style,): Text(user.email!,style: style),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [
                      Colors.orangeAccent,
                      Colors.orange
                    ],
                end: Alignment.bottomCenter,
                    ) 
                  ),


                currentAccountPicture : user.photoURL == null ? Container(
                  width: 100,height: 150,
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  image : DecorationImage(
                      image: AssetImage("assets/profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ) :

                CachedNetworkImage(
                  imageUrl: user.photoURL!,
                  imageBuilder: (context, imageProvider) =>
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    placeholder: (context, url) => Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                      ),
                    ),


                    errorWidget: (context, url, error) =>
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            user.photoURL!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                
            // profile
              drawer(
                icon: Icons.account_circle_sharp,
                title: "Profile",
                ontap: (){
                Navigator.of(context).pop();
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Profile()));
              }, color: Colors.black),
              

              // bookmark
              drawer(
                icon: Icons.bookmark,
                title: "Bookmark",
                ontap: (){
                Navigator.of(context).pop();
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: bookMark()));
              }, color: Colors.deepPurple),


              // featured book
              drawer(
                icon: Icons.workspace_premium,
                title: "Featured Books",
                ontap: (){
                Navigator.of(context).pop();
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: featured()));
              }, 
                color: Colors.yellow),

              // feedback
              drawer(
                icon: Icons.feedback,
                title: "Feedback",
                color: Colors.green,
                ontap: ()=> launch('mailto:jafri@realike.in?subject=FeedBack')),


              // contact us
              drawer(
                icon: Icons.contact_mail,
                title: "Contact Us",
                color: Colors.blueAccent,
                ontap: (){
                Navigator.of(context).pop();
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,
                child: contact()
                  )
                );
              }
            ),
                
                  
              // rate my app
              drawer(
                icon: Icons.star_rate,
                title: "Rate our app",
                color: Colors.yellow[600],
                ontap: ()=> StoreRedirect.redirect(androidAppId : "com.gigls.audiobook")),

              // report bugs
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: drawer(icon: Icons.bug_report, title: "Report Bug", color: Colors.red ,ontap: ()=>launch('mailto:jafri@realike.in?subject=Bug Report')),
                  )
                ),    
        ]
      ),
          )
    );          
  }


Widget drawer({required icon, required title, required ontap , required color})=> ListTile(leading: Icon(icon,color: color,size: 28,),title: Text(title, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),),onTap: ontap,);
}
