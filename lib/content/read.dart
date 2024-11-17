import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFReader extends StatelessWidget {
  final String pdfUrl;
  
  const PDFReader({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Book'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // PDF.clearCache();  // Correct way to clear cache
            },
          ),
        ],
      ),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        defaultPage: 0,
        // For error widgets, we need to return a Widget
        onError: (error) => Center(
          child: Text(error.toString()),
        ),
        // For page errors, we need to return a Widget
        onPageError: (page, error) => Center(
          child: Text('Error loading page $page: $error'),
        ),
        onPageChanged: (page, total) {
          debugPrint('Page $page of $total');
        },
        // Loading widget should return a Widget
        // : const Center(
        //   child: CircularProgressIndicator(),
        // ),
      ).fromUrl(
        pdfUrl,
        placeholder: (progress) => Center(
          child: Text('$progress %'),
        ),
        errorWidget: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}