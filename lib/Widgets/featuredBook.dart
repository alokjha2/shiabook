


import 'package:alok/Widgets/bookBox.dart';
import 'package:alok/models/books.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';





Widget featuredbook()=>StreamBuilder(
  stream: FirebaseFirestore.instance.collection('Book').where("Featured",isEqualTo: true, ).limit(5).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if(snapshot.hasData){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          // Book book = Book.fromFirestore(document);

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
        return SizedBox(height: 100,);
        }
      }
  );


  