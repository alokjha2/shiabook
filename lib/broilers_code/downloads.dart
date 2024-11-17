// // saved downloaded chapter page

// import 'dart:io';

// import 'package:alok/audiofunc/common.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:path_provider/path_provider.dart';


// import 'package:audio_session/audio_session.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:rxdart/rxdart.dart';
 

// class Downloads extends StatefulWidget {
//   @override
//   State<Downloads> createState() => _DownloadsState();
// }

// class _DownloadsState extends State<Downloads> with WidgetsBindingObserver {

//   final _player = AudioPlayer();
//   var files;
//   List<FileSystemEntity> _folders = [];
//   List songs = [];
//   Future<void> getDir() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final dir = directory.path;
//   String pdfDirectory = '$dir/';
//   final myDir = new Directory(pdfDirectory);
//   setState(() {
//     _folders = myDir.listSync(recursive: true, followLinks: false);
//   });
//   print(_folders);

//   for(FileSystemEntity entity in _folders) {
//   String path = entity.path;
//   if(path.endsWith('.mp3')){
//     print("yeah");
//     songs.add(entity);
//   }else{
//     Text("No downloads yet");
//   }
// }
// }

// void delete({required index})async{
//   await _folders[index].delete().then((value) => errromsg(msg: "Successfully deleted"));
//   songs.remove(index);

// }


// @override
// void initState() {
//   super.initState();
//     getDir();
//     WidgetsBinding.instance.addObserver(this);
  
// }

//   void errromsg({required msg}){
//     Fluttertoast.showToast(
//         msg: msg,
//     );
//   }

//   Future<void> _init({required mp3}) async {
//     // final session = await AudioSession.instance;
//     // await session.configure(AudioSessionConfiguration.speech());
//     // // Listen to errors during playback.
//     // _player.playbackEventStream.listen((event) {},
//     //     onError: (Object e, StackTrace stackTrace) {
//     //       errromsg(msg: "error");
          

          
//     // }
//     // );
//     try {
//       await _player.setFilePath(
//         songs.first.path.split("/").last);
//           } catch (e) {
//           errromsg(msg: e);
          
//     }
//   }
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused) {
//       _player.stop();
//     }
//   }

//   Stream<PositionData> get _positionDataStream =>
//       Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
//           _player.positionStream,
//           _player.bufferedPositionStream,
//           _player.durationStream,
//           (position, bufferedPosition, duration) => PositionData(
//               position, bufferedPosition, duration ?? Duration.zero));
  

//   Widget build(BuildContext context) {
//     bool playing = false;
//     return Scaffold(
      
//       body: songs == []? Center(child: Text("No donwloads")):
//            ListView.separated(  //if file/folder list is grabbed, then show here
//               itemCount: _folders.length,
//               itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: (){
//                         _init(mp3: songs[index].path.split("/").last);
//                       },
//                       child:
                      
//                        Card(
//                         child:ListTile(
//                            title:
                           
//                             Text
//                            (
//                             //  songs.toString()
//                             songs[index].path.split("/").last.toString()
//                             //  _folders[index].path.split('/').last.toString()
//                            ),
//                           //  leading: Text(index.toString()),
//                            trailing: Row(
//                              mainAxisSize: MainAxisSize.min,
//                              children: [
                               
//                                IconButton(onPressed: (){
//                                  setState(() {
//                                    playing == !playing;
//                                  });
//                                }, icon: 
//                                playing==true?Icon(Icons.pause):
                               
//                                Icon(Icons.play_arrow)
//                                ),
//                                IconButton(onPressed: (){
//                                  delete(index: index);
//                                },icon: Icon(Icons.delete, color: Colors.redAccent,),),
//                              ],
//                            )
//                         )
//                       ),
//                     );
//               }, separatorBuilder: (BuildContext context, int index) { return Divider(); },
//           )
//     );
//   }


//   }
