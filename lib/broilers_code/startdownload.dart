// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path_provider/path_provider.dart';

// class DownloadingDialog extends StatefulWidget {
//   final String? mp3;
//   final String? title;
//   final String? book;
//   const DownloadingDialog({Key? key, required this.mp3,required this.title, this.book }) : super(key: key);

//   @override
//   _DownloadingDialogState createState() => _DownloadingDialogState();
// }

// class _DownloadingDialogState extends State<DownloadingDialog> {
//   Dio dio = Dio();
//   double progress = 0.0;
//   var fileLocation;

//   void startDownloading() async {
//     String url = widget.mp3!;

//     final String fileName = "${widget.book}-${widget.title}.mp3";

//     String path = await _getFilePath(fileName);

//     await dio.download(
//       url,
//       path,
//       onReceiveProgress: (recivedBytes, totalBytes) {
//         setState(() {
//           progress = recivedBytes / totalBytes;
//         });

//         print(progress);
//       },
//       deleteOnError: true,
//     ).then((_) {
//       Navigator.pop(context);
//       errromsg(msg: "${widget.title} − mp3 downloaded");
      
//     });
//   }
//   void errromsg({required msg}){
//     Fluttertoast.showToast(
//         msg: msg,
//     );
//   }


//   Future<String> _getFilePath(String filename) async {
//     final dir = await getApplicationDocumentsDirectory();
//     fileLocation = "${dir.path}/$filename"; 
//     return fileLocation;
//   }

//   @override
//   void initState() {
//     super.initState();
//     startDownloading();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String downloadingprogress = (progress * 100).toInt().toString();

//     return AlertDialog(
//       // backgroundColor: Colors.black,
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const CircularProgressIndicator.adaptive(),
//           const SizedBox(
//             height: 20,
//           ),

//           Text(
//             "Downloading: $downloadingprogress%",
//             // style: const TextStyle(
//             //   color: Colors.white,
//             //   fontSize: 17,
//             // ),
//           ),

//         ],
//       ),
//     );
//   }
// }
