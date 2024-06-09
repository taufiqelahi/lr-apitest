
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lr_api_test/View/simple_pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ShowPdf extends StatefulWidget {
  const ShowPdf({super.key});

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                 final p= await SimplePdf.generate("evsjv ‡U·U 2", "Tgsdsdbfhv");

                 SaveAndOpen.openFile(p);// Page
                },
                child: Text("Show Pdf"))
          ],
        ),
      ),
    );
  }
}

Future<Uint8List> makePdf() async {
  final pdf = pw.Document();

  // Load the custom font
  final fontData = await rootBundle.load('images/fonts/Roboto-Regular.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "About Cat",
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ]),
              pw.Divider(borderStyle: pw.BorderStyle.dashed),
              pw.Text(
                "hello",
                style: pw.TextStyle(
                  font: ttf,
                  fontSize: 12,
                ),
              ),
            ]);
      }));

  return pdf.save();
}
