import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;

class SimplePdf{
  static Future<File>generate(String text1,String text2)async{
    final pdf=pw.Document();
    final fontData = await rootBundle.load('images/fonts/SiyamRupaliANSI.ttf');
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(pw.Page(build: (_) {
      return pw.Center(
        child: pw.Column(children: [
          pw.Text(text1, style: pw.TextStyle(font: ttf, fontSize: 30)),
          pw.Text(text2, style: pw.TextStyle( fontSize: 30))
        ]),
      );
    }));
    return SaveAndOpen.savePdf(name: 'simple', pdf: pdf);
  }
}



class SaveAndOpen {
  static Future<File> savePdf({required String name, required pw.Document pdf}) async {
    Directory? directory;
    if (Platform.isAndroid) {
      final directories = await getExternalCacheDirectories();
      directory = directories?.first;
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    if (directory == null) {
      throw Exception("Could not get the directory");
    }

    final file = File('${directory.path}/$name.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
  static Future<void> openFile(File file)async{
    final path=file.path;
    await OpenFile.open(path);
  }

}