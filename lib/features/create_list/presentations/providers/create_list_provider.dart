import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/app_permissions.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';

class CreateListProvider<T> extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  String? _filteringByGroup;
  set setFilterByGroup(String value) {
    this._filteringByGroup = value;
    notifyListeners();
  }

  String? get filteringByGroup => _filteringByGroup;

  GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "create list");
  GlobalKey<FormState> get globalKey => _globalKey;

  String? fromDate;
  String? toDate;
  final startFromTEXT = TextEditingController();
  final numOfHoursTEXT = TextEditingController();

  createList(List<EmployeeModel> employees) {
    List<EmployeeModel> emp = [];
    employees.forEach((e) {
      emp.add(
        EmployeeModel(
          group: e.group,
          id: e.id,
          name: e.name,
          isAvailable: e.isAvailable,
          phone: e.phone,
          workingFrom: fromDate,
          workingTo: toDate,
          vacationFrom: e.vacationFrom,
          vacationsTo: e.vacationsTo,
        ),
      );
    });
    _context.pushReplacementNamed(
      RoutesStrings.listOfEmployees,
      extra: emp,
    );
  }

  changeFromDateTime() async {
    final date = await Utils.displayDatePicker(
      (value) {
        print(value);
        fromDate = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      selected:
          fromDate != null ? DateFormat().add_yMEd().parse(fromDate!) : null,
    );
    print(date);
  }

  changeToDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        toDate = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      initial: DateFormat()
          .add_yMEd()
          .parse(fromDate ?? DateFormat().add_yMEd().format(DateTime.now())),
      selected: toDate != null
          ? DateFormat().add_yMEd().parse(toDate!)
          : DateFormat().add_yMEd().parse(
              fromDate ?? DateFormat().add_yMEd().format(DateTime.now())),
    );
  }

  init() async {
    await AppPermissions.askLocalStoragePermission();
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }
}
