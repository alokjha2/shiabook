




// import 'package:alok/Widgets/bookBox.dart';
// import 'package:alok/content/bookPage.dart';
// import 'package:alok/home.dart';
// import 'package:alok/models/books.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';

// class DataSearch extends SearchDelegate{

//   final firestoreref = FirebaseFirestore.instance;
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Book').snapshots();
//   List<String> setSearchParam(String title) {
//       List<String> caseSearchList = [];
//       String temp = "";
//       for (int i = 0; i < title.length; i++) {
//         temp = temp + title[i].toLowerCase();
//         caseSearchList.add(temp);
//       }

//       for (var i = 0; i < title.split(" ").length; i++) {
//         String keyword = title.split(" ")[i].toLowerCase();

//         caseSearchList.add(keyword);
//       }
//       return caseSearchList;
//     }
    
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: (){
//         query = '';
//       },
//       icon: Icon(
//         Icons.clear
//         )
//       )
//     ];
//   }



//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//     icon: Icon(Icons.arrow_back),
//       onPressed: ()
//         => Navigator.of(context).push(MaterialPageRoute(builder : (_) => MainPage()
//         )
//         )

//     );
//   }





//   @override
//   Widget buildResults(BuildContext context) {
//   var listToShow;  

//     return PaginateFirestore(
//     shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //       crossAxisCount: 4,
//           //       crossAxisSpacing: 10.0,
//           //       mainAxisSpacing: 10.0,
//           //       childAspectRatio:.8,
//           //     ),
          
//           itemBuilderType:
//         PaginateBuilderType.listView, //Change types accordingly
//           itemBuilder: (context, documentSnapshots, index) {
//             final data = documentSnapshots[index].data() as Map<String, dynamic>;
//             String img = data["Img"];
//             String name = data["Title"];
//             String id = data['Id'];
//             String pdf = data['pdf'];
//             bool featured = data["Featured"];
//             String description = data["Description"];
//             String listen = data["Listen"];
//             String read = data["Read"];
//             String publisher = data["publisher"];
//             String credits = data["credits"];
//             String aboutAuthor = data["Author"];
//             List bookmark = data["Bookmark"];

//             return Card(
//               child: ListTile(
//                 //           // leading: Image.network(img, filterQuality: FilterQuality.low,),
            
//                 title: Text(name,  style: 
//                      GoogleFonts.ubuntu(textStyle: TextStyle()),),
//                 // subtitle: Text("By "+ ,style: 
//                 //      GoogleFonts.ubuntu(textStyle: TextStyle()),),
              
//               ),
//             );
//              },
//           query: FirebaseFirestore.instance.collection('Book').orderBy("number",descending: true),
//           itemsPerPage: 4,
//           isLive: true,
//         );
  
    
    
       

//   }
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     var listToShow;  

//     return PaginateFirestore(
//     shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //       crossAxisCount: 4,
//           //       crossAxisSpacing: 10.0,
//           //       mainAxisSpacing: 10.0,
//           //       childAspectRatio:.8,
//           //     ),
          
//           itemBuilderType:
//         PaginateBuilderType.listView, //Change types accordingly
//           itemBuilder: (context, documentSnapshots, index) {
//             final data = documentSnapshots[index].data() as Map<String, dynamic>;
//             String img = data["Img"];
//             String name = data["Title"];
//             String id = data['Id'];
//             String pdf = data['pdf'];
//             bool featured = data["Featured"];
//             String description = data["Description"];
//             String listen = data["Listen"];
//             String read = data["Read"];
//             String publisher = data["publisher"];
//             String credits = data["credits"];
//             String aboutAuthor = data["Author"];
//             List bookmark = data["Bookmark"];

//             return Card(
//               child: ListTile(
//                 //           // leading: Image.network(img, filterQuality: FilterQuality.low,),
            
//                 title: Text(name,  style: 
//                      GoogleFonts.ubuntu(textStyle: TextStyle()),),
//                 // subtitle: Text("By "+ ,style: 
//                 //      GoogleFonts.ubuntu(textStyle: TextStyle()),),
              
//               ),
//             );
//              },
//           query: FirebaseFirestore.instance.collection('Book').orderBy("number",descending: true),
//           itemsPerPage: 4,
//           isLive: true,
//         );
//   }}



import 'package:alok/content/bookPage.dart';
import 'package:alok/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Search Books by name';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder : (_) => MainPage()
        )
        )

    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('No results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final realQuery = query.toLowerCase();
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Book')
          .where('Title', isGreaterThanOrEqualTo: query)
          .where('Title', isLessThan: query + "z").limit(10)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;
        return ListView(
          children: documents.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            String img = data["Img"];
            String name = data["Title"];
            String id = data['Id'];
            String pdf = data['pdf'];
            bool featured = data["Featured"];
            String description = data["Description"];
            String listen = data["Listen"];
            String read = data["Read"];
            String publisher = data["publisher"];
            String credits = data["credits"];
            String aboutAuthor = data["Author"];
            List bookmark = data["Bookmark"];

            return InkWell(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Music(img: img, name: name, author: aboutAuthor,  description: description, pdf: pdf, id: id, listen: listen, read: read, bookmark: bookmark, Publisher: publisher, credits: credits)));
              },
              child: Card(
                child: ListTile(
                  leading: Image.network(img),
                  title: Text(name,  style: 
                       GoogleFonts.lato(textStyle: TextStyle()),),
                  subtitle: Text(aboutAuthor, style: 
                       GoogleFonts.lato(textStyle: TextStyle(), ),maxLines: 2,),
                
                ),
              ),
            );
             

          }).toList(),
        );
      },
    );
  }
}
