




import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


  final user = FirebaseAuth.instance.currentUser!;
  late int loop;
Widget continueListening({required List recent}){

  print(recent.toList());

  int length = recent.length;
  int reallength = length-1;
  //  for(int i = reallength; reallength>=0; ++reallength){
  //   int loop = reallength;     
  // //  for( var i = num ; i >= 1; i-- ) { 
  // //     factorial *= i ; 

  // //  } 
  // //  print(factorial); 

  //  }
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Book').where("Id", isEqualTo: recent[0],).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    
    if(snapshot.hasData){
      return SingleChildScrollView(
        child: Row(
          children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String img = data["Img"];
            String name = data["Title"];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: InkWell(
                onTap: (){
                  
                },
                child: Container(
                  height: 80,
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // horizontal spacing
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                        child: Container(
                          decoration: BoxDecoration(
                    
                         color: Colors.white,
                           borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
                
                ),
                          height: double.maxFinite,
                          width: 70,
                          child:
                          
                          
                          CachedNetworkImage(
                                      imageUrl: img,
                                      imageBuilder: (context, imageProvider) =>
                           
                    
                  Container(
                                        height: double.maxFinite,
                                        decoration: BoxDecoration(
                         color: Colors.transparent,
                           borderRadius: BorderRadius.circular(10),
                  image: 
                  
                  DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                  
                  ),
                  ),
                                      placeholder: (context, url) => Container(
                                        height: 200,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 100.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            width: 2,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          image: DecorationImage(
                                            colorFilter: ColorFilter.linearToSrgbGamma(),
                                            image: NetworkImage(
                                              img,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),),
              
                  
                      ),
                    
                      Text(name)
                    ],
                  ),
                  decoration: BoxDecoration(
                    
                       color: Colors.white,
                       border: Border.all(
                  color: Colors.grey,
                  width: 1,
                          ),
                         borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
                
                ),
                  ),
              ),
            )
              ]
            );
          }
        ).toList()
        ),
      );
  } 
    else{
      return SizedBox(height: 100,);
    }
  }
);}




Widget recentBooks()=>StreamBuilder(
  // initialData: ,
  stream: FirebaseFirestore.instance.collection('userData').where("userEmail", isEqualTo: user.email).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    
    if(snapshot.hasData){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            // String img = data["Img"];
            // List category= data["Category"];
            List recent = data["recentBook"];
           
        return 
        
        // Text("$category");
        continueListening(recent: recent);
          }
        ).toList()
      ),
    );
  } 
    else{
      return SizedBox(height: 100,);
    }
  }
);

