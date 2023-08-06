import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/services/pdf/pdf_genrate_api.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';

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
        Duration(seconds: 3),
        () async => await PdfGenerateApi.generate(EmployeeModel()).then(
          (value) {
            print(value);

            isLoadSave = false;
            notifyListeners();
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
            .then((value) async => await Share.shareFiles([value.path]))
            .then((value) {
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
