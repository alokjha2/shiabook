




import 'package:alok/Widgets/bookBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'continueListening.dart';

Widget recommended({ required List category}){
  return StreamBuilder(
  stream: FirebaseFirestore.instance.collection('Book').where("Category", arrayContainsAny: category,).limit(5).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if(snapshot.hasData){
      return SingleChildScrollView(
      child: Row(
        children: snapshot.data!.docs.map(
        (DocumentSnapshot document){
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          String img = data["Img"];
          String name = data["Title"];
          String id = data['Id'];
          String pdf = data['pdf'];
          bool featured = data["Featured"];
          String description = data["Description"];
          String listen = data["Listen"];
          String read = data["Read"];
          String aboutAuthor = data["Author"];
          List bookmark = data["Bookmark"];
          String publisher = data["publisher"];
          String credits = data["credits"];
      return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              bookBox(img: img,name: name,id: id,pdf: pdf,featured: featured,description: description, listen: listen, read: read,aboutAuthor: aboutAuthor,bookmark: bookmark, context: context, publisher: publisher, credits: credits)
        
            
          ]
              );
        }
      ).toList()
        ),
    );
      } 
      else{
        return SizedBox(height: 200,);
        }
      }
  );
  }
Widget userInterest()=>StreamBuilder(
  stream: FirebaseFirestore.instance.collection('userData').where("uid", isEqualTo: user.uid).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    
    if(snapshot.hasData){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            // String img = data["Img"];
            List category= data["category"];
            List recent = data["recentBook"];
           
        return recommended(category: category);
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
