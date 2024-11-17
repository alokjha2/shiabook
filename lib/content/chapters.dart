// chapters page
import 'package:alok/audiofunc/button.dart';
import 'package:alok/audiofunc/common.dart';
import 'package:alok/constants/image.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';


void errromsg({required msg}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}



class chapters extends StatefulWidget {
  final String? chapterid;
  final String? img;
  final String author;
  final String? book;
  final String? id;
  chapters({Key? key,  this.chapterid, this.img, this.book, required this.author, this.id}) : super(key: key);
  @override
  State<chapters> createState() => _chaptersState();
}

class _chaptersState extends State<chapters>with WidgetsBindingObserver {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _player = AudioPlayer();
  final _player1 = AudioPlayer();
  bool playing = false;
  Dio dio = Dio();
  double progress = 0.0;
  late var chapterName = "";
  final ScrollController page = ScrollController();
  late String audioLink="";
    


  @override
  void initState() {
    super.initState();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.grey.shade300,
      systemNavigationBarIconBrightness: Brightness.dark,
      ));
  }
  Future<void> _init({required mp3, required name}) async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    _player.play();
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          errromsg(msg: "no internet");   
    });
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
        mp3,
        ),
        tag: MediaItem(
          playable: true,
          id: name,
          album: widget.book,
          title: name,
          artUri: Uri.parse(widget.img!),
          ),
        )
      );
    } catch (e) {
    errromsg(msg: "error");  
    }
  }
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
              color: Colors.grey.shade200,
        ),
      child: 
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),onPressed: (){
            return Navigator.of(context).pop();
          },
          ),
          // actions: [
          //   IconButton(onPressed: (){

          //   }, icon: Icon(Icons.more_vert_rounded))
          // ],
          // backgroundColor: Colors.transparent,
          elevation: 1,
        ),
        body: buildchapter()
      ));
  }
Widget buildchapter()=>StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('Book').doc(widget.chapterid).collection("chapter").orderBy("num", descending: false).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


    if (snapshot.hasError) {
      return Center(child: Text("Sorry, you are offline"),);
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.orange,));
    }

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (_, index) {
        return Column(
                children: [
                  SizedBox(height: 5,),
                  CachedNetworkImage(

                    imageUrl: widget.img!,

                    imageBuilder: (context, imageProvider) => Container(
                      width: 250,
                      height: 370,
                      decoration: BoxDecoration(
                        color: Colors.transparent,borderRadius: BorderRadius.circular(15),image: DecorationImage(image: NetworkImage(widget.img!),fit: BoxFit.cover))),

                    placeholder: (context, url) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context)
                              .scaffoldBackgroundColor,
                        ),
                        image:  DecorationImage(
                          image: AssetImage(
                              image
                            // 'assets/1024.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 14,),
                  Text(widget.book!, style: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),),
                  SizedBox(height: 4,),
                  chapterName==""?
                  Text("No chapter playing",style: GoogleFonts.lato(),): Text(chapterName,style: GoogleFonts.lato(),),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: StreamBuilder<PositionData>(
                        stream: _positionDataStream,
                        builder: (context, snapshot, ) {
                          final positionData = snapshot.data;
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ProgressBar(
                              baseBarColor: Colors.grey.shade300,
                              barHeight: 4,
                              thumbColor: Colors.orange,
                              progressBarColor: Colors.orange.shade400,
                              bufferedBarColor: Colors.orange.shade100,
                              timeLabelTextStyle: TextStyle(color: Colors.black),
                              progress: positionData?.position ?? Duration.zero, 
                              total: positionData?.duration ?? Duration(),
                              timeLabelLocation: TimeLabelLocation.above,
                              buffered: positionData?.bufferedPosition ?? Duration.zero,
                              onSeek: _player.seek,
                              timeLabelPadding: 3,
                                  ),
                                );
                              },
                            ),
                          ),
                  ControlButtons(positionDataStream: _positionDataStream, player: _player, ),
                  ListView.builder(
                    controller: page,
                    itemCount: snapshot.data!.size,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    addRepaintBoundaries: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index) { 
                        DocumentSnapshot ds =snapshot.data!.docs[index];
                        String title = ds["title"];
                        String audio = ds["audio"];
                        audioLink==ds["audio"];
                        chapterName==title;
                return 
                 Padding(
                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                   child: Column(
                     children: [
                      Divider(indent: 4,endIndent: 4,color: Colors.grey.shade400,),
                       ListTile(title: Text(title, style: GoogleFonts.lato(),),
                       trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                         children: [
                          audioLink!=audio?
                            IconButton(onPressed: (){
                              _init(mp3: audio, name: title);
                             setState(() {
                               audioLink=audio;
                               chapterName=title;
                             });
                            }, icon: Icon(Icons.play_arrow, size: 30,color: Colors.black54,)):IconButton(onPressed: (){
                              setState(() {
                              audioLink = "";
                              });
                              _player.pause();
                            }, icon : Icon(Icons.pause,size: 30,color: Colors.black54,)),
                         ]
                       ),
                    ),
                  ],
                ),
              );
            }
          ),
        ],
      );});
  },   
);

  

Widget forwardButton({required onTap, required Icons}) => 
  IconButton(
    onPressed: onTap,
    icon: Icon(Icons, color: Colors.black,size: 30,),
  );
}



