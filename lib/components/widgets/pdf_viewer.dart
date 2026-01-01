import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';

import '../../flutter_flow/flutter_flow_theme.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String url;

  const PdfPreviewScreen({Key? key, required this.url}) : super(key: key);

  Future<String> _downloadPdf(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(response.bodyBytes);
      return file.path;
    } else {
      throw Exception('Failed to download PDF');
    }
  }

  static Future<File> downloadPdf(String url) async {
    final response = await http.get(Uri.parse(url));
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/temp.pdf');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
  static Future<Widget> buildPdfThumbnail(String pdfUrl) async {
    final file = await downloadPdf(pdfUrl);

    final document = await PdfDocument.openFile(file.path);
    final page = await document.getPage(1);

    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.png,
    );

    await page.close();

    return Image.memory(pageImage!.bytes);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        backgroundColor: FlutterFlowTheme.of(context).primary,
      ),
      body: FutureBuilder<String>(
        future: _downloadPdf(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final path = snapshot.data!;
          return PDFView(
            filePath: path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            
          );
        },
      ),
    );
  }
}
