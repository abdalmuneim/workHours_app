import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class NewEmployeeProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;
  final _firebase = FirebaseFirestore.instance;
  GlobalKey<FormState> _globalKey = GlobalKey(debugLabel: 'new employee');
  GlobalKey<FormState> get globalKey => _globalKey;

  final nameTEXT = TextEditingController();
  final phoneTEXT = TextEditingController();
  final newGroupTEXT = TextEditingController();
  String? vacationFromTEXT;
  String? vacationsToTEXT;
  String? groupTEXT;
  bool isLoadingEmp = false;
  bool isLoadingGro = false;

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) {
    this._filteringByGroup = value;
    groupTEXT = value.values.first;
    notifyListeners();
  }

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

  addEmployee(int numOfEmp) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      groupTEXT = newGroupTEXT.text;
      isLoadingEmp = true;
      notifyListeners();
      _firebase
          .collection(Collections.employees)
          .add(
            EmployeeModel(
              id: numOfEmp,
              name: nameTEXT.text.trim(),
              phone: phoneTEXT.text.trim(),
              group: groupTEXT ?? newGroupTEXT.text.trim(),
              vacationFrom: vacationFromTEXT,
              vacationsTo: vacationsToTEXT,
            ).toMap(),
          )
          .then((value) {
        isLoadingEmp = false;
        notifyListeners();
      }).catchError((error) {
        Utils.showError(error);
      });
    }
  }

  addNewGroup() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      isLoadingGro = true;
      notifyListeners();
      Future.delayed(
        Duration(seconds: 2),
        () {
          _firebase
              .collection(Collections.groups)
              .doc(newGroupTEXT.text.trim())
              .set({"groupName": newGroupTEXT.text.trim()});
          _firebase
              .collection(Collections.employeesGroup)
              .doc(groupTEXT)
              .collection(DateTime.now().millisecondsSinceEpoch.toString())
              .add(
                EmployeeModel(
                  name: nameTEXT.text.trim(),
                  phone: phoneTEXT.text.trim(),
                  group: newGroupTEXT.text.trim(),
                  vacationFrom: vacationFromTEXT,
                  vacationsTo: vacationsToTEXT,
                ).toMap(),
              );
          isLoadingGro = false;
          notifyListeners();
          _context.pop();
        },
      );
    }
  }
}
