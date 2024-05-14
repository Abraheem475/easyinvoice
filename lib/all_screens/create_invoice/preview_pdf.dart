import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/colors_class/color_class.dart';

class PreviewPdf extends StatelessWidget {
  final pw.Document doc;
  const PreviewPdf({
    super.key,
    required this.doc,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,),
        ),
        centerTitle: true,
        title: const Text("Preview",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: PdfPreview(
          build: (PdfPageFormat pageFormat) => doc.save(),
          allowSharing: true,
          allowPrinting: true,
          initialPageFormat: PdfPageFormat.a4,
          pdfFileName: "Doc.pdf",
        ),
      ),
    );
  }
}