import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenDocument {
  static Future<File> savePdf({
    required String name,
    required Document pdf,
  }) async {
    final file = File('/storage/emulated/0/Download/$name');
    await file.writeAsBytes(await pdf.save());
    debugPrint('/storage/emulated/0/Download/$name');
    return file;
  }

  static Future<void> openPdf(File file) async {
    final path = file.path;
    await OpenFile.open(path);
  }
}
