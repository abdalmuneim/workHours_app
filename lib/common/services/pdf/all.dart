import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart'
    hide Widget
    hide Container
    hide EdgeInsets
    hide TextStyle
    hide TextSpan
    hide RichText
    hide Column
    hide CrossAxisAlignment
    hide SizedBox
    hide Alignment
    hide Text
    hide MainAxisAlignment
    hide Row
    hide Padding
    hide ListView
    hide Expanded
    hide Divider
    hide Theme
    hide ThemeData
    hide EdgeInsets;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdfFromWidgetToImage(GlobalKey widgetKey) async {
  // Create a PDF document
  final pdf = pw.Document();

  // Convert the Flutter widget to an image
  final ByteData? byteData = await widgetToImage(widgetKey);
  final image = pw.MemoryImage(byteData!.buffer.asUint8List());

  // Add the image to the PDF document
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        );
      },
    ),
  );

  // Save the PDF as bytes
  return pdf.save();
}

Future<ByteData?> widgetToImage(GlobalKey widgetKey) async {
  RenderRepaintBoundary boundary =
      widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  return byteData;
}

Future<File> savePdf(Uint8List pdfData, String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/$fileName');
  await file.writeAsBytes(pdfData);
  print('PDF saved to ${file.path}');
  return file;
}
