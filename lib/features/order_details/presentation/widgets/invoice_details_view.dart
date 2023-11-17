import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class InvoiceDetailsView extends StatelessWidget {
  const InvoiceDetailsView({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الفاتورة')),
      body: PDFView(
        filePath: path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
      ),
    );
  }
}
