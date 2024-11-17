



import 'package:alok/helpers/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class contact extends StatefulWidget {
  contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}


class _contactState extends State<contact> {
  final TextEditingController feedback = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final sizedbox = const SizedBox(height: 14,);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Contact Us")
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,// means staright change, top of the page
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          TextFormField(
            minLines: 7,
            maxLines: 8,
            decoration: InputDecoration(
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey)
                // borderSide: BorderSide(color: Colors.grey)
            ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)
              ),
                borderSide: BorderSide(color: Colors.grey)
            ),
            filled: true,
            hintText: "Write your message...",
          ),
            controller: feedback,          
          ),
          sizedbox,
          InkWell(
            onTap: (){
              contact();
            },
            child: Container(
                color: Colors.orange,
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Text("Submit"),

                ),
              ),
            ),
          ]
        ),
      ),
    );
  }


  contact()async{
    final doc = FirebaseFirestore.instance.collection('Other').doc("contactUs");
    await doc.update({
      "contactUs" : FieldValue.arrayUnion([feedback.text]),
    }).then((value) {
      message(message: "successful");
      feedback.clear();
      Navigator.of(context);
      }).onError((error, stackTrace) => message(message: "sorry! Try later"));
  }
}