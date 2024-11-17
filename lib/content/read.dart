// PDF page


import 'dart:io';

import 'package:alok/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class read extends StatefulWidget {
  final String pdf;
  read({Key? key, required this.pdf}) : super(key: key);

  @override
  State<read> createState() => _readState();
}

class _readState extends State<read> {
  @override
    void initState() {
      super.initState();  
    }

   @override
   Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("E-Book"),),
     backgroundColor: Colors.white,
    //  body: Container(
    //      color: Colors.white,
    //      child: SfPdfViewer.network(
          
    //        "${widget.pdf}",
    //        scrollDirection: PdfScrollDirection.horizontal,
    //        onDocumentLoaded: message(message: "Let's read"),
    //     ),
    //   ),      
    );
  }
}