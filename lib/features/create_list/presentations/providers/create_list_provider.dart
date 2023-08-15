import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class CreateListProvider<T> extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) =>
      this._filteringByGroup = value;
  Map<FilteringByGroupEnum, String>? get filteringByGroup => _filteringByGroup;

  GlobalKey<FormState> _globalKey =
      GlobalKey<FormState>(debugLabel: "create list");
  GlobalKey<FormState> get globalKey => _globalKey;

  String? fromDateTEXT;
  String? toDateTEXT;
  final startFromTEXT = TextEditingController();
  final numOfHoursTEXT = TextEditingController();

  createList() {
    _context.pushReplacementNamed(RoutesStrings.listOfEmployees);
  }

  changeFromDateTime() async {
    final date = await Utils.displayDatePicker(
      (value) {
        print(value);
        fromDateTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      selected: fromDateTEXT != null
          ? DateFormat().add_yMEd().parse(fromDateTEXT!)
          : null,
    );
    print(date);
  }

  changeToDateTime() {
    Utils.displayDatePicker(
      (value) {
        print(value);
        toDateTEXT = DateFormat().add_yMEd().format(value);
        notifyListeners();
      },
      initial: DateFormat().add_yMEd().parse(
          fromDateTEXT ?? DateFormat().add_yMEd().format(DateTime.now())),
      selected: toDateTEXT != null
          ? DateFormat().add_yMEd().parse(toDateTEXT!)
          : DateFormat().add_yMEd().parse(
              fromDateTEXT ?? DateFormat().add_yMEd().format(DateTime.now())),
    );
  }

  init() {
    // setFilterByGroup = {FilteringByGroupEnum.All: groups.values.toList().first};
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }
}
