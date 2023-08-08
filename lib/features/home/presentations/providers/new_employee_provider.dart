import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class NewEmployeeProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'new employee');
  GlobalKey<FormState> get globalKey => _globalKey;

  final nameTEXT = TextEditingController();
  final newGroupTEXT = TextEditingController();
  String? vacationFromTEXT;
  String? vacationsToTEXT;
  final groupTEXT = TextEditingController();

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) =>
      this._filteringByGroup = value;
  Map<FilteringByGroupEnum, String>? get filteringByGroup => _filteringByGroup;

  changeFromDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        vacationFromTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      selected: vacationFromTEXT != null
          ? DateFormat().add_yMEd().parse(vacationFromTEXT!)
          : null,
    );
  }

  changeToDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        vacationsToTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      initial: DateFormat().add_yMEd().parse(
          vacationFromTEXT ?? DateFormat().add_yMEd().format(DateTime.now())),
      selected: vacationsToTEXT != null
          ? DateFormat().add_yMEd().parse(vacationsToTEXT!)
          : DateFormat().add_yMEd().parse(vacationFromTEXT ??
              DateFormat().add_yMEd().format(DateTime.now())),
    );
  }

  addEmployee() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      Future.delayed(
        Duration(seconds: 2),
        () => _context.pop(true),
      );
    }
  }

  back() {
    _context.pop();
  }
}
