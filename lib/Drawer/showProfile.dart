// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';



// class shape extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     double height = size.height;
//     double width = size.width;
//     var path = Path();
//     path.lineTo(0, height-60);
//     path.quadraticBezierTo(width/2, height/2, width, height-50);
//     path.lineTo(width,0);
//     path.close();
//     return path;
//   }
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }  
// }

// class profile extends StatefulWidget {
//   profile({Key? key}) : super(key: key);
//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   final user = FirebaseAuth.instance.currentUser!;
//   final height = SizedBox(height: 10,);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//    appBar:  AppBar(
//     elevation: 2,
//     backgroundColor: Colors.white,
//     title: Text("Profile Page"),
//         ),


//       body : StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('userData').where("uid", isEqualTo: "${user.uid}").snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if(snapshot.hasData){
//             return Stack(
//               children: snapshot.data!.docs.map(
//               (DocumentSnapshot document){
//               Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//               String name = data["name"];
//               String email = data["email"];
//               String city = data["city"];
//               String phone = data["phone number"];

//               return
              
              
//               Stack(
//           alignment: Alignment.centerLeft,
//           children: <Widget>[
//             // background image and bottom contents
//             ListView(
//               children: <Widget>[
//                 Container(
//                   height: 200.0,
//                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover))
//                   ),
//                 ],
//             ),
//             // Profile image
//             Positioned(
//               top: 130.0, // (background container size) - (circle height / 2)
//               left: 20,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   Container(
//                     height: 130,
//                     width: 130,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: 
//                         AssetImage("assets/logo.png"),
//                         fit: BoxFit.cover, filterQuality: FilterQuality.high, alignment: Alignment.center),
//                         shape: BoxShape.rectangle,
//                         border: Border.all(
//                           width: 2,
//                           color: Colors.white,
//                         ),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.lightBlueAccent,
//                             spreadRadius: 3,
//                             blurRadius: 6,
//                             ),
//                         ],
//                       ),
//                     ),
//                   height,
//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                     children:  [
//                       Text(name,style:GoogleFonts.lato(textStyle: TextStyle(
//                         fontWeight: FontWeight.w600, fontSize: 24),
//                 ),),

                      
//                 Icon(Icons.verified, color: Colors.blue,size: 30,)
//                     ],
//                   ),
//                   Text(email,style:GoogleFonts.lato(textStyle: TextStyle(
//                         fontWeight: FontWeight.w400,color: Colors.grey, fontSize: 16),
//                 ),),
//                 // SizedBox(height: 6,),
//                   Text(phone,style:GoogleFonts.lato(textStyle: TextStyle(
//                         fontWeight: FontWeight.w400,color: Colors.grey, fontSize: 16),
//                 ),),
//                 height,


//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Center(child: SizedBox(child: Icon(Icons.location_on_rounded, size: 20,color: Colors.black,))),
//                       Text(city,style:GoogleFonts.lato(textStyle: TextStyle(
//                             fontWeight: FontWeight.w400,color: Colors.black, fontSize: 18),
//                 ),),
//                     ],
//                   ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }
//             ).toList()
//           );
//         } 
//         else{
//           return Center(child: Text(""),);
//           }
//         }
//       ),
//     );
//   }
// }




import 'package:alok/constants/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../broilers_code/continueListening.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       counter = counter + 1;
      //     });
      //   },
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     child: Icon(
      //       Icons.add
      //     ),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         gradient: LinearGradient(
      //           colors: [
      //             Colors.orange.shade800,
      //             Colors.orangeAccent
      //             ],
      //           )
      //         ),
      //   ),
      // ),
      body: 
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('userData').where("uid", isEqualTo: "${user.uid}").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData){
            return Stack(
              children: snapshot.data!.docs.map(
              (DocumentSnapshot document){
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              String name = data["name"];
              String email = data["email"];
              String city = data["city"];
              String phone = data["phone number"];

              return
              
              
               Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                         Colors.orange.shade800,
                        Colors.orangeAccent

                        ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),onPressed: (){
                            Navigator.of(context).pop();
                          },))
                        ],
                      ),
                      
                      
                      SizedBox(height: 70.0,),


                      CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage(profile),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                        name,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      )
                    ),

                      SizedBox(height: 3.0,),

                      Text(
                        email,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),)
                  ]
                  ),
                ),
              ),

              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child:Card(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),),
                                Divider(color: Colors.grey[300],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.account_circle_rounded,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Name",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text(
                                          name == ""? "Not Available" : name,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Icon(
                                      Icons.email,
                                      color: Colors.yellowAccent[400],
                                      size: 35,
                                    ),
                                    
                                    SizedBox(width: 20.0,),


                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [


                                        Text(
                                          "Email",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),

                                        Text(
                                          email == "" ? "Not Available" : email,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Icon(
                                      Icons.phone,
                                      color: Colors.pinkAccent[400],
                                      size: 35,
                                    ),
                                    
                                    SizedBox(width: 20.0,),


                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [


                                        Text(
                                          "Phone Number",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),

                                        Text(
                                          phone == "" ? "Not Available" : phone,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(height: 20.0,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    Icon(
                                      Icons.add_location_sharp,
                                      color: Colors.lightGreen[400],
                                      size: 35,
                                    ),

                                    SizedBox(width: 20.0,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          "City",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),

                                        Text(
                                          city == "" ? "Not Available" : city,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                // SizedBox(height: 20.0,),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [

                                //     Icon(
                                //       Icons.add_location_sharp,
                                //       color: Colors.lightGreen[400],
                                //       size: 35,
                                //     ),

                                //     SizedBox(width: 20.0,),

                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [

                                //         Text(
                                //           "City",
                                //           style: TextStyle(
                                //             fontSize: 15.0,
                                //           ),
                                //         ),

                                //         Text(
                                //           city == "" ? "Not Available" : city,
                                //           style: TextStyle(
                                //             fontSize: 12.0,
                                //             color: Colors.grey[400],
                                //           ),
                                //         )
                                //       ],
                                //     )
                                //   ],
                                // ),
                                // SizedBox(height: 20.0,),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [

                                //     Icon(
                                //       Icons.add_location_sharp,
                                //       color: Colors.lightGreen[400],
                                //       size: 35,
                                //     ),

                                //     SizedBox(width: 20.0,),

                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [

                                //         Text(
                                //           "City",
                                //           style: TextStyle(
                                //             fontSize: 15.0,
                                //           ),
                                //         ),

                                //         Text(
                                //           city == "" ? "Not Available" : city,
                                //           style: TextStyle(
                                //             fontSize: 12.0,
                                //             color: Colors.grey[400],
                                //           ),
                                //         )
                                //       ],
                                //     )
                                //   ],
                                // ),
                                // SizedBox(height: 20.0,),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [

                                //     Icon(
                                //       Icons.add_location_sharp,
                                //       color: Colors.lightGreen[400],
                                //       size: 35,
                                //     ),

                                //     SizedBox(width: 20.0,),

                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [

                                //         Text(
                                //           "City",
                                //           style: TextStyle(
                                //             fontSize: 15.0,
                                //           ),
                                //         ),

                                //         Text(
                                //           city == "" ? "Not Available" : city,
                                //           style: TextStyle(
                                //             fontSize: 12.0,
                                //             color: Colors.grey[400],
                                //           ),
                                //         )
                                //       ],
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                  ),
                ),
              ],
            ),
            
          // Positioned(
          //     top: MediaQuery.of(context).size.height*0.45,
          //     left: 20.0,
          //     right: 20.0,
          //     child: Card(
          //       child: Padding(
          //         padding:EdgeInsets.all(16.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Container(
          //               child: Column(
          //                 children: [
          //                   Text('Battles',
          //                   style: TextStyle(
          //                     color: Colors.grey[400],
          //                     fontSize: 14.0
          //                   ),),
          //                   SizedBox(height: 5.0,),
          //                   Text("$counter",
          //                   style: TextStyle(
          //                     fontSize: 15.0,
          //                   ),)
          //                 ],
          //               )
          //             ),

          //             Container(
          //               child: Column(
          //               children: [
          //                 Text('Birthday',
          //                   style: TextStyle(
          //                       color: Colors.grey[400],
          //                       fontSize: 14.0
          //                   ),),
          //                 SizedBox(height: 5.0,),
          //                 Text('April 7th',
          //                   style: TextStyle(
          //                     fontSize: 15.0,
          //                   ),)
          //               ]),
          //             ),

          //             Container(
          //                 child:Column(
          //                   children: [
          //                     Text('Age',
          //                       style: TextStyle(
          //                           color: Colors.grey[400],
          //                           fontSize: 14.0
          //                       ),),
          //                     SizedBox(height: 5.0,),
          //                     Text('19 yrs',
          //                       style: TextStyle(
          //                         fontSize: 15.0,
          //                       ),
          //                     ),

          //                   ],
          //                 )
          //             ),
          //           ],
          //         ),
          //       )
          //     )
          // )
        ],
      );
  
              }
            ).toList()
          );
        } 
        else{
          return Center(child: Text(""),);
          }
        }
      ),
    );
      
      
    }
}





