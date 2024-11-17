


import 'package:alok/helpers/message.dart';
import 'package:alok/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class category extends StatefulWidget {
  category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  late List categoryList = [];
  final doc = FirebaseFirestore.instance.collection('customerServices').doc("Category").snapshots();
  ScrollController mainPage = ScrollController();

  // late final categoryList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child : data()
      ) 
    );
  }

  Widget data() => StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Other').where("doc", isEqualTo: "Category").snapshots(),
          builder : (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Text('');
            } else {
              return ListView.builder(
                // controller: mainPage,
                itemCount: snapshot.data!.size,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];
                  List all = ds["Category"];
                  categoryList = ds["Category"];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(image: AssetImage("assets/shia.png"))),
                        // child: 
                        ),
                      RichText(
                        text:  TextSpan(
                          children: [
                            TextSpan(
                              style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.black,fontSize: 40),),
                              text: "Your ",
                            ),

                            TextSpan(
                              style: GoogleFonts.ubuntu(textStyle: const TextStyle(color: Colors.orange,fontSize: 40),),
                              text: "Feed",
                            ),
                          ]
                        )
                      ),

            SizedBox(height: 10,),
            Text("Select atleast 5 category for your feed, you can edit it later."),
            SizedBox(height: 10,),
            // SizedBox(height: 10,),
                      GridView.builder(
                        controller: mainPage,
                        shrinkWrap: true,
                        itemCount: all.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 3
                          ),
                        itemBuilder: (context, int index) => container(list: all, index1: index),
                      
                      ),
                      SizedBox(height: 20,),
                      createAccount()
                    ],
                  );
                },
              );
            }
          },
        );


Widget text()=> Text("Select");


final yourList = [];
Widget container({required list, required int index1}){ 
  return 
  InkWell(
  onTap: (){
    bool found = yourList.contains(categoryList[index1]);

        if(found){
          yourList.remove(categoryList[index1]);
    message(message: "${categoryList[index1]} removed");

        }else{
    yourList.add(
      categoryList[index1]
      );
    message(message: "${categoryList[index1]} Added");
        }
  },
  child:   Container(
    
  
    child : ListTile(
    trailing : yourList.contains(list[index1])? Icon(Icons.verified): Text(""),
    title: Text(list[index1],
      style: TextStyle(color: Colors.orange),
      ),
    ),

    decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 1,
                  ),
      borderRadius: BorderRadius.circular(4)

        ),
      ),
    );
  }

  createProfileCategory({required list})async{
  // final joined = DateFormat.yMMMEd().format(DateTime.now());
  final user = FirebaseAuth.instance.currentUser!;
  final userdata = FirebaseFirestore.instance.collection("userData").doc("${user.uid}");
  final String? userImage = user.photoURL;
  final List recent = [];
  await userdata.set({
    "name" : user.displayName,
    "userEmail" : user.email,
    "uid" : user.uid,
    "Category" : list,
    "recentBook" : recent
  }).then((value)async {
    await Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MainPage()));
    message(message: "Profile created");}).onError((error, stackTrace) => message(message: "error while creating profile"));
    

}

  Widget createAccount()=> InkWell(
    onTap: 

        (){
          var count = yourList.length;
          print(yourList);
          int less = 5 - count;
          count >= 5 ? createProfileCategory(list: yourList):message(message: "Select $less more");
        },
    child: Container(
      color: Colors.orange,
      width: double.infinity,
      height: 40,
      child: Center(
        child: Text("Next"
        //   onPressed: 
        
        // child: Text("Next"),
        // //  icon: Icon(Icons.camera_outlined)
         ),
      ),
    ),
  );
}
   