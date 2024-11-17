// // this screen creates search result screen




// import 'package:alok/content/bookPage.dart';
// import 'package:alok/helpers/message.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';

// class searchResults extends StatefulWidget {
//   final String search;
//   searchResults({Key? key, required this.search}) : super(key: key);
//   @override
//   State<searchResults> createState() => _searchState();
// }

// class _searchState extends State<searchResults> {
//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('Book').where("searchBy",arrayContainsAny: [
//           widget.search
//         ]).limit(7).snapshots(),


//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error"));
//           }

//           if(snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator(color: Colors.orange,));
//           }      
      
//           if(snapshot.data!.docs.isNotEmpty){
//             return ListView(
//               children: snapshot.data!.docs.map(
//               (DocumentSnapshot document){
//               Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//                 String img = data["Img"];
//                   String name = data["Title"];
//                   String id = data['Id'];
//                   String pdf = data['pdf'];
//                   bool featured = data["Featured"];
//                   String description = data["Description"];
//                   String listen = data["Listen"];
//                   String read = data["Read"];
//                   String aboutAuthor = data["Author"];
//                   List bookmark = data["Bookmark"];
//                   String publisher = data["publisher"];
//                   String credits = data["credits"];


//                   return Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, PageTransition(
//                           type: PageTransitionType.rightToLeft,
//                           child: Music(
//                               Publisher: publisher,
//                               credits: credits,
//                               name: name,
//                               bookmark : bookmark,
//                               pdf: pdf,
//                               img: img,
//                               description: description,
//                               id: id, listen: listen,read: read,
//                               author: aboutAuthor,
//                           )
//                         )
//                       );
//                     },
//                   child: Card(
//                     elevation: 4,
//                     shadowColor: Colors.white,
//                     child: Container(
//                       width: 100,  
//                       height: 100,
//                       decoration: BoxDecoration(
//                             color: Color(0XFFFAFA),
//                             borderRadius: BorderRadius.circular(5),
//                             shape: BoxShape.rectangle,
//                           ),          
//                     child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CachedNetworkImage(
//                         imageUrl: img,
//                         imageBuilder: (context, imageProvider) =>

//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: Container(
//                           width: 100,
//                           height: double.maxFinite,
//                           decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           shape: BoxShape.rectangle,
//                           image: DecorationImage(
//                             image: imageProvider,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),

//                         placeholder: (context, url) => 
//                         Container(
//                           height: 150,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             color: Colors.orange.shade300,
//                           ),
//                         ),

//                         errorWidget: (context, url, error) =>
//                         Container(
//                           width: 50.0,
//                           height: 50.0,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 2,
//                               color: Theme.of(context).scaffoldBackgroundColor,
//                             ),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'assets/1024.png',
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),

                      
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(name, style: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),),
//                           SizedBox(height: 2,),
//                           SizedBox(
//                             height: 60,
//                             width: 200,
//                             child: Text(aboutAuthor, style: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),maxLines: 2,overflow: TextOverflow.ellipsis)),
//                           ],
//                         ),


//                         Spacer(),
//                         Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: featured == true?Icon(Icons.diamond_outlined, color: Colors.lightBlue, size: 24,) : Text(""),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       ).toList()
//     );
//   } 
//         else{
//             return Center(
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 400,
//                       width: 400,
//                       decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/no.jpg")))),

//                     Text("No books available", style: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.w400)),
//                   ],
//                 ),
//               ),
//             );
//           }
//         }
//       )
//     );
//   }
// }

