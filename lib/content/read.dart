// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// class PDFReader extends StatelessWidget {
//   final String pdfUrl;
  
//   const PDFReader({Key? key, required this.pdfUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('E-Book'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               // PDF.clearCache();  // Correct way to clear cache
//             },
//           ),
//         ],
//       ),
//       body: PDF(
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: true,
//         pageSnap: true,
//         defaultPage: 0,
//         // For error widgets, we need to return a Widget
//         onError: (error) => Center(
//           child: Text(error.toString()),
//         ),
//         // For page errors, we need to return a Widget
//         onPageError: (page, error) => Center(
//           child: Text('Error loading page $page: $error'),
//         ),
//         onPageChanged: (page, total) {
//           debugPrint('Page $page of $total');
//         },
//         // Loading widget should return a Widget
//         // : const Center(
//         //   child: CircularProgressIndicator(),
//         // ),
//       ).fromUrl(
//         pdfUrl,
//         placeholder: (progress) => Center(
//           child: Text('$progress %'),
//         ),
//         errorWidget: (error) => Center(
//           child: Text(error.toString()),
//         ),
//       ),
//     );
//   }
// }


// import 'package:example/page.dart';
import 'package:alok/content/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class PdfReader extends StatefulWidget {
  const PdfReader({
    Key? key,
  }) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:InteractiveViewer(
      minScale: 0.5,
      maxScale: 10.0,
      // InteractiveViewer(
      panEnabled: true, 
        child: PageFlipWidget(
          key: _controller,
          backgroundColor: Colors.yellow,
          initialIndex: 0,
          // isRightSwipe: true,
          lastPage: Container(
              color: Colors.white,
              child: const Center(child: Text('Last Page!'))),
          children: <Widget>[
            for (var i = 0; i < 10; i++) DemoPage(page: i),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.looks_5_outlined),
        onPressed: () {
          _controller.currentState?.goToPage(5);
        },
      ),
    );
  }
}