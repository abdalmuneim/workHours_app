import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class CreateListProvider<T> extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) =>
      this._filteringByGroup = value;
  Map<FilteringByGroupEnum, String>? get filteringByGroup => _filteringByGroup;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String? fromDateTEXT;
  String? toDateTEXT;
  final startFromTEXT = TextEditingController();
  final numOfHoursTEXT = TextEditingController();

  createList() {
    _context.pushNamed(RoutesStrings.listOfEmployees);
  }

  changeFromDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        fromDateTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      selected: fromDateTEXT != null
          ? DateFormat().add_yMEd().parse(fromDateTEXT!)
          : null,
    );
  }

  changeToDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        toDateTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      selected: toDateTEXT != null
          ? DateFormat().add_yMEd().parse(toDateTEXT!)
          : null,
    );
  }

  init() {
    setFilterByGroup = {FilteringByGroupEnum.All: groups.values.toList().first};
  }

  back() {
    _context.pop();
  }
}