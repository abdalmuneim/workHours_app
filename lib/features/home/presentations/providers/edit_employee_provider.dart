import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workhours/common/helper/date_time.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';

class EditEmployeeProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  final _firebase = FirebaseFirestore.instance;

  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'edit employee');
  GlobalKey<FormState> get globalKey => _globalKey;

  final nameTEXT = TextEditingController();
  final phoneTEXT = TextEditingController();
  final newGroupTEXT = TextEditingController();
  String? vacationFromTEXT;
  String? vacationsToTEXT;
  String? groupTEXT;
  bool isLoadingEmp = false;
  bool isLoadingGro = false;

  String? _filteringByGroup;
  set setFilterByGroup(String value) {
    this._filteringByGroup = value;
    groupTEXT = value;
    notifyListeners();
  }

  String? get filteringByGroup => _filteringByGroup;

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

  editEmployee(int? numOfEmp) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      newGroupTEXT.text.isNotEmpty ? groupTEXT = newGroupTEXT.text : null;
      isLoadingEmp = true;
      notifyListeners();
      _firebase
          .collection(Collections.employees)
          .doc("$numOfEmp")
          .update(
            EmployeeModel(
              id: numOfEmp,
              name: nameTEXT.text.trim(),
              phone: phoneTEXT.text.trim(),
              isAvailable: isDateTimeBetween(
                  DateTime.now(),
                  parseDateTime(vacationFromTEXT),
                  parseDateTime(vacationsToTEXT)),
              group: groupTEXT ?? newGroupTEXT.text.trim(),
              vacationFrom: vacationFromTEXT,
              vacationsTo: vacationsToTEXT,
            ).toMap(),
          )
          .then((value) {
        _editEmployeeToGroup(numOfEmp);
        Provider.of<HomeProvider>(_context).getAllEmployees();
        isLoadingEmp = false;
        notifyListeners();
        _context.pop();
      }).catchError((error) {
        Utils.showError(error);
      });
    }
  }

  _editEmployeeToGroup(int? numOfEmp) {
    _firebase
        .collection(Collections.employeesGroup)
        .doc(groupTEXT)
        .collection(DateTime.now().millisecondsSinceEpoch.toString())
        .doc("$numOfEmp")
        .update(
          EmployeeModel(
            id: numOfEmp,
            name: nameTEXT.text.trim(),
            phone: phoneTEXT.text.trim(),
            isAvailable: isDateTimeBetween(
                DateTime.now(),
                parseDateTime(vacationFromTEXT),
                parseDateTime(vacationsToTEXT)),
            group: groupTEXT ?? newGroupTEXT.text.trim(),
            vacationFrom: vacationFromTEXT,
            vacationsTo: vacationsToTEXT,
          ).toMap(),
        )
        .then((value) => print("added success"))
        .catchError((onError) => print(onError));
  }

  addNewGroup() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (newGroupTEXT.text.isNotEmpty) {
      isLoadingGro = true;
      groupTEXT = newGroupTEXT.text;
      notifyListeners();
      try {
        _firebase
            .collection(Collections.groups)
            .doc(newGroupTEXT.text.trim())
            .set({"groupName": newGroupTEXT.text.trim()})
            .then((value) => log("added success"))
            .catchError((onError) => log(onError));
      } catch (e) {
        print(e);
      }
      isLoadingGro = false;
      notifyListeners();
      newGroupTEXT.clear();
      _context.pop();
    }
  }

  init(EmployeeModel employee) async {
    nameTEXT.text = employee.name ?? "";
    vacationFromTEXT = employee.vacationFrom;
    vacationsToTEXT = employee.vacationsTo;
    groupTEXT = employee.group!;
  }

  back() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }

  @override
  void dispose() {
    isLoadingEmp = false;
    isLoadingGro = false;
    newGroupTEXT.clear();
    nameTEXT.clear();
    phoneTEXT.clear();
    vacationFromTEXT = null;
    vacationsToTEXT = null;
    super.dispose();
  }
}
