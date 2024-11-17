// Book page 


import 'package:alok/constants/colors.dart';
import 'package:alok/content/chapters.dart';
import 'package:alok/content/read.dart';
import 'package:alok/helpers/message.dart';
import 'package:alok/models/books.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';



class Music extends StatefulWidget {
  final String? id;
  final String? img;
  final String? name;
  final String? mp3;
  final String? description;
  final String pdf;
  final String read;
  final List bookmark;
  final String listen;
  final String? author;
  final String? Publisher;
  final String? credits;
  Music({Key? key,
   @required this.img, @required this.name, @required this.author, @required this.mp3, @required this.description, required this.pdf, @required this.id, required this.listen, required this.read, required this.bookmark,required this.Publisher, required this.credits}) : super(key: key);

  @override
  State<Music> createState() => _MusicState(
  );
}

class _MusicState extends State<Music> with WidgetsBindingObserver {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Book');
  final _player = AudioPlayer();
  final pad =  EdgeInsets.fromLTRB(20, 2, 20, 2);
  final user = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //   systemNavigationBarColor: Colors.transparent,
    //   systemNavigationBarIconBrightness: Brightness.light,
    //   statusBarColor: Colors.transparent,
    // ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name!
          ),
        ),

      backgroundColor: grey,

      body : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),

            CachedNetworkImage(
              imageUrl: widget.img!,
              imageBuilder: (context, imageProvider) =>
                PhysicalModel(
                  borderRadius: BorderRadius.circular(6),
                  shadowColor: Colors.black54,
                  color: Colors.black,
                  elevation:30,
                  child: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
              placeholder: (context, url) => Container(
                height: 150,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                        color: Colors.orange.shade300,
                      ),
                    ),

              errorWidget: (context, url, error) =>
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),

                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/1024.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),


            SizedBox(height: 10,),

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(onPressed: (){
                    bookmarkPost(widget.id);
                  }, 
                  icon:  widget.bookmark.contains(user!.uid) ? const Icon(Icons.bookmark,color: Colors.blue,size: 26) : const Icon(Icons.bookmark_outline,color: Colors.grey,size: 23,),
                  ),
                  
                  Text("Bookmark", style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 14)))              
                ],
              ),

                  button(
                    text: "share Book",
                    icon: Icons.share, colorS: Colors.grey, ontap: (){
                      Share.share("Hey I am listening to ${widget.name} on SHIA app , it is free you can download it too,", subject: "https://play.google.com/store/apps/details?id=com.gigls.audiobook");
                      }
                    )
                  ]
                ),


              Divider(color: Colors.grey,endIndent: 30,indent: 30,thickness: 1,),

              SizedBox(height: 10,),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ListenButton(numbers: widget.read, text: "Read", icon: Icons.picture_as_pdf, 
                onTap: (){
                  update(id: widget.id, what: "Read", howmuch: widget.listen);
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: read(pdf: widget.pdf)));
                    }),
            
            
                  ListenButton(numbers: widget.listen, text: "Listen", icon: Icons.headphones,
                  onTap: ()async{
                    update(id: widget.id, what: "Listen", howmuch: widget.listen);
                    await Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: chapters(chapterid: widget.id, img: widget.img, book: widget.name, author: widget.author.toString(), id: widget.id)));  
                    }),
                  ],
                ),


                title(text: "About Book"),
                height(),
                description(text: widget.description),

                SizedBox(height: 20,),
                
                title(text: "About Author"),
                height(),
                description(text: widget.author),

                SizedBox(height: 20,),
                title(text: "About Publisher"),
                height(),
                description(text: widget.Publisher),

                SizedBox(height: 20,),
                title(text: "Credit"),
                height(),
                description(text: widget.credits),

                SizedBox(height: 20,),


        ],
      ),
    )
  );
}

Widget title({required text}) => 
  Padding(
    padding: pad,
    child: Text(text, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),),
  );


Widget description({required text}) => 
  Padding(
    padding: pad,
    child: Text(text,style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w400)),),
  );

Widget height()=> SizedBox(height: 4,);


Widget ListenButton({required numbers, required text, required icon, required onTap}) => 
  Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [Colors.red, Colors.orangeAccent], begin: Alignment.centerLeft, end: Alignment.centerRight),
          shape: BoxShape.rectangle,
          ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,children: [

              // icon,
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(icon,shadows: [],size: 26, color: Colors.white,),
            ),
            
            SizedBox(height: 20,),

            Text(text, style: TextStyle(fontSize: 22, color: Colors.white, ),)
            ],
          ),
        ),
      ),
    ),
          SizedBox(height: 10,),
    
          Text(numbers)
      ],
    );
  


void bookmarkPost(id) {
    DocumentReference reference =
        FirebaseFirestore.instance.collection('Book').doc(widget.id);
      reference.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot['Bookmark'].contains(user!.uid)) {
          reference.set({
            'Bookmark': FieldValue.arrayRemove([user!.uid])
          }, SetOptions(merge: true)).then((value) => message(message: "Removed from bookmarks"));
        } else {
          reference.set({
            'Bookmark': FieldValue.arrayUnion([user!.uid])
          }, SetOptions(merge: true)).then((value) => message(message: "Added to bookmarks"));
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }



// more features on pressed
Widget button({required icon, required ontap, required colorS, required text})=> Column(
  children: [
        IconButton(onPressed: ontap, icon: Icon(icon, color: colorS,size: 23,)),
        Text(text, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 14)),)
  ],
);

void update({required id, required what, howmuch})async{
  final no = int.parse(howmuch);
  final data = no+1;
  final datastr = data.toString();
  final doc = FirebaseFirestore.instance.collection('Book').doc(widget.id);
  await doc.update({
    what : datastr
  });

} 



}
