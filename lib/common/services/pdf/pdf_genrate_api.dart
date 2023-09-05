import 'dart:io';
import 'package:flutter/material.dart'
    hide Widget
    hide Container
    hide EdgeInsets
    hide TextStyle
    hide TextSpan
    hide RichText
    hide Column
    hide Page
    hide CrossAxisAlignment
    hide Center
    hide Stack
    hide Directionality
    hide TextDirection
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
    hide Image
    hide MemoryImage
    hide EdgeInsets;
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';

import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/helper/date_time.dart';
import 'package:workhours/common/services/pdf/pdf_api.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/features/create_list/presentations/providers/create_list_provider.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/generated/l10n.dart';

class PdfGenerateApi {
  static Future<File> generate(List<EmployeeModel> employee) async {
    final pdf = Document();

    // Load your custom font
    final ByteData notoNaskhArabic = await rootBundle
        .load("assets/fonts/NotoNaskhArabic-VariableFont_wght.ttf");
    final ttfFont = await Font.ttf(notoNaskhArabic);
    /* final ByteData lamaSansBold =
        await rootBundle.load("assets/fonts/LamaSans-Bold.ttf");
    final ttfFontLamaSansBold = await Font.ttf(lamaSansBold);
    final ByteData lamaSansRegular =
        await rootBundle.load("assets/fonts/LamaSans-Regular.ttf"); 
    final ttfFontLamaSansRegular = await Font.ttf(lamaSansRegular);*/

    /// create pages
    pdf.addPage(
      MultiPage(
        theme: ThemeData.withFont(base: ttfFont, bold: ttfFont),
        build: (context) {
          return [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  _buildHead(),
                  for (var i = 0; i < employee.length; i++) ...[
                    // buildHead(),
                    _listOfEmployeesWidget(context, employee[i]),
                  ]
                ],
              ),
            ),
          ];
        },
      ),
    );

    return PdfApi.saveDocument(name: 'Mnawbat-${DateTime.now()}.pdf', pdf: pdf);
  }

  static BuildContext _context = NavigationService.context;

  static _buildHead() {
    return Column(
      children: <Widget>[
        Text(
          S.of(_context).menuOfEmployees,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 14),

        /// date
        Container(
          height: 30,
          width: 70.w,
          child: RichText(
            maxLines: 2,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                color: PdfColor.fromHex("#6A6A6A"),
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: "${S.of(_context).from} ",
                ),
                TextSpan(
                  text: Provider.of<CreateListProvider>(_context).fromDate,
                ),
                TextSpan(
                  text: " ${S.of(_context).to} ",
                ),
                TextSpan(
                  text: Provider.of<CreateListProvider>(_context).toDate,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),

        ///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(_context).group,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PdfColor.fromHex("#6A6A6A"),
                fontSize: 20,
              ),
            ),
            Text(
              S.of(_context).name,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PdfColor.fromHex("#6A6A6A"),
                fontSize: 20,
              ),
            ),
            Text(
              S.of(_context).date,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PdfColor.fromHex("#6A6A6A"),
                fontSize: 20,
              ),
            ),
            Text(
              S.of(_context).day,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: PdfColor.fromHex("#6A6A6A"),
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: PdfColor.fromHex("#AFB0B1")),
        SizedBox(height: 10),
      ],
    );
  }

  static Widget _listOfEmployeesWidget(Context context, EmployeeModel emp) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// group
          Text(
            emp.group ?? "",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: PdfColor.fromHex("#6A6A6A"),
            ),
          ),

          /// name
          Text(
            emp.name ?? "",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColor.fromHex("#6A6A6A"),
            ),
          ),

          /// date
          Text(
            emp.workingFrom ?? "",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColor.fromHex("#6A6A6A"),
            ),
          ),

          /// day
          Text(
            parseDateTime(emp.workingFrom)?.day.toString() ?? "",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PdfColor.fromHex("#6A6A6A"),
            ),
          ),
        ],
      ),
    );
  }
}
