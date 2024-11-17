




import 'package:alok/books.dart';
import 'package:alok/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';



Widget category({required page})=>StreamBuilder(
  stream: FirebaseFirestore.instance.collection('Other').where("doc",isEqualTo: "Category").snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if(snapshot.hasData){
      return SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: snapshot.data!.docs.map(
          (DocumentSnapshot document){
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            List Category= data["Category"];
            return categoryBox(context: context, Category:Category, page: page);
          }
        ).toList()
      ),
    );
  } 
else{
    return 
    SizedBox(height: 100,);
    }
  }
);
  
Widget categoryBox({required BuildContext context, required List Category, required page}) => 
  Expanded(
    child: GridView.builder(
      controller: page,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.4,
        crossAxisCount: 4,
      ),
      shrinkWrap: true,
      itemCount: Category.length,
      itemBuilder: (BuildContext context, index) {
        return Material(
          child: InkWell(
            splashColor: transparent,
            onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: book(category : Category[index])));
              },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 6),
              child: Container(
                
                height: 30,
                width: 60,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Category[index], 
                        maxLines: 1, overflow: TextOverflow.ellipsis,)
                    ],
                  )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: orange,
                  shape: BoxShape.rectangle,
                ),
                ),
              ),
            ),
        );
        }
      ),
    );

