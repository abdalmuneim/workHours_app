import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workhours/common/resources/app_color.dart';
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

  saveList(List<EmployeeModel> emp) async {
    isLoadSave = true;
    notifyListeners();

    try {
      // await AppPermissions.askLocalStoragePermission();
      Future.delayed(
        Duration(seconds: 2),
        () async => await PdfGenerateApi.generate(emp).then(
          (File value) {
            print(value);
            isLoadSave = false;
            notifyListeners();
            Utils.showToast(
              S.of(_context).pdfFileSavedAtPath(""),
              icon: Icon(Icons.save, color: AppColors.primary),
            );
          },
        ),
      );
    } catch (e) {
      print(e);
      isLoadSave = false;
      notifyListeners();
    }
  }

  shareListOnWhatsApp(List<EmployeeModel> emp) async {
    isLoadShare = true;
    notifyListeners();
    print("----------------------");
    try {
      // await AppPermissions.askLocalStoragePermission();
      Future.delayed(
        Duration(seconds: 2),
        () async => await PdfGenerateApi.generate(emp).then((File file) async {
          await Share.shareFiles([file.path]);
          Utils.showToast(
            S.of(_context).pdfFileSavedAtPath(""),
            icon: Icon(Icons.save, color: AppColors.primary),
          );
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
