import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/pdf/pdf_genrate_api.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/generated/l10n.dart';

class ListOfEmployeesProvider extends ChangeNotifier {
  final BuildContext _context = NavigationService.context;
  final GlobalKey widgetKey = GlobalKey();

  bool isLoadShare = false;
  bool isLoadSave = false;

  saveList() async {
    isLoadSave = true;
    notifyListeners();
    print("----------------------");
    try {
      Future.delayed(
        Duration(seconds: 2),
        () async => await PdfGenerateApi.generate(EmployeeModel()).then(
          (File value) {
            print(value);
            isLoadSave = false;
            notifyListeners();
            Utils.showSuccess(S.of(_context).pdfFileSavedAtPath(value.path));
          },
        ),
      );
    } catch (e) {
      print(e);
      isLoadSave = false;
      notifyListeners();
    }
  }

  shareListOnWhatsApp() async {
    isLoadShare = true;
    notifyListeners();
    print("----------------------");
    try {
      Future.delayed(
        Duration(seconds: 2),
        () async => await PdfGenerateApi.generate(EmployeeModel())
            .then((File file) async {
          await Share.shareFiles([file.path]);
          Utils.showSuccess(S.of(_context).pdfFileSavedAtPath(file.path));
        }).then((value) {
          isLoadShare = false;
          notifyListeners();
        }),
      );
    } catch (e) {
      print(e);
      isLoadShare = false;
      notifyListeners();
    }
  }
}
