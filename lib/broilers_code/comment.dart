
// import 'package:alok/helpers/message.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:comment_box/comment/comment.dart';
// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CommentPage extends StatefulWidget {
//   final String id;
//   CommentPage({required this.id, Key? key}) : super(key: key);

//   @override
//   State<CommentPage> createState() => _CommentPageState();
// }

// class _CommentPageState extends State<CommentPage> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   final TextEditingController updatecommentController = TextEditingController();
//   final user = FirebaseAuth.instance.currentUser!;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late final comment;

//   @override
//   void initState() {
//     super.initState();
//     comment = FirebaseFirestore.instance.collection('Book').doc(widget.id).collection('comment').orderBy('createdOn', descending: true);
//     SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//       statusBarBrightness: Brightness.light,
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Colors.white,
//       systemNavigationBarIconBrightness: Brightness.dark,
//       ));
  
  
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Comment Page",),
//       ),
//       body: Container(
//         child: CommentBox(
//           userImage: user.photoURL,
//               child: StreamBuilder(
//                 stream : comment.limit(10).snapshots(),
//                 builder : (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
//                   if (snapshots.hasData) {
//                     return ListView(
//                         children: snapshots.data!.docs
//                             .map(
//                               (e) => ListTile(
//                                 horizontalTitleGap: 1,
//                                 leading: InkWell(child: CircleAvatar(backgroundImage: NetworkImage(e["userimg"]),backgroundColor: Colors.lightBlue,)),
//                                 title: Text(e["username"],
//                                 ),   

//                                 trailing: e["useremail"] == user.email?
//                                   PopupMenuButton<int>(
//             onSelected: (item)=> onSelected(context, item, e["commentid"]),
//             itemBuilder: (context) => [
//               PopupMenuItem(child: Text("edit"),
//                 value: 1,
//               ),
//             PopupMenuDivider(height: 2,),
//             PopupMenuItem(
//               child: Text("delete"),
//             value: 2,
//             )
//           ]):PopupMenuButton<int>(
//             onSelected: (item)=> onSelected(context, item, e["commentid"]),
//             itemBuilder: (context) => [
//               PopupMenuItem(child: Text("report"),
//                 value: 3,
//               ),
            
//           ]),

//                             // ),                       
//                         subtitle : Text(e["comment"]
//                             ),
//                           ),  
//                         ).toList());
//               } else if (snapshots.hasError) {
//                 return Center(child: Text("No internet"),);
//               }
//               return Center(child: CircularProgressIndicator());
//             },
//           ),


//           labelText: 'Write a comment...',
//           withBorder: false,
//           errorText: 'Comment cannot be blank',
//           sendButtonMethod: () {
//             if (formKey.currentState!.validate()) {
//               makecomment();
//               commentController.clear();
//               FocusScope.of(context).unfocus();
//               } else {
//                 message(message: "Sorry, error occured");
//             }
//           },
//           formKey: formKey,
//           commentController: commentController,
//           backgroundColor: Colors.black,
//           textColor: Colors.white,
//           sendWidget: Icon(
//             Icons.send_sharp,
//             size: 30,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }


//   // show dialog box to update comment
//   newcomment({required id}){
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         title: Text("Edit"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             TextField(
//               controller: updatecommentController,
//             ),
//           ],
//         ),

//         actions: <Widget>[
//           TextButton(
//             onPressed: (){
//               editcomment(id:id);
//               Navigator.of(context).pop();
//             },
//             child: Text("Save"),)
//             ]
//           )
//         );
//       }
    


//  Future makecomment() async{
//     final todaydate = DateTime.now().toString();
//     final Purchasedate = todaydate.split(" ");
//     final usedate = Purchasedate[0];
   
//    final comment1 = FirebaseFirestore.instance.collection('Book').doc(widget.id).collection('comment').doc(); 
//    final json = {
//         'id': user.uid,
//         "commentid" : comment1.id,
//         'comment': commentController.text,
//         'userimg': user.photoURL,
//         'username': user.displayName,
//         'useremail': user.email,
//         'commenttime' :  usedate,
//         "edited" : false,
//         'createdOn': FieldValue.serverTimestamp()
//    };

//    await comment1.set(json).then((value) => message(message: "comment saved!")); // set will replace the field of docs to json
//  }
//  void onSelected(BuildContext context, int item, id ){
//         switch (item){

//           // edit      
//           case 1:
//           newcomment(id: id);
//           break;


//           // delete
//           case 2:
//           deletecomment(id: id);
//           break;

//           // report
//           case 3:
//           message(message: "comment reported!");

//           break;
//         }
//       }

  
//   // update comment
//   editcomment({required id})async{
//     final comment1 = FirebaseFirestore.instance.collection('Book').doc(widget.id).collection('comment').doc(id);
//     comment1.update({
//       "comment" : updatecommentController.text,
//       "edited" : true
//     }
//   ).then((value) => message(message: "comment edited!")); 
// }
 
//    deletecomment({required id})async{
//    final comment1 = FirebaseFirestore.instance.collection('Book').doc(widget.id).collection('comment').doc(id);
//    comment1.delete().then((value) => message(message: "comment deleted!"));
//    }
// }
    