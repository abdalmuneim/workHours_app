import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:workhours/common/helper/date_time.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';

class EditEmployeeProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

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

  editEmployee(int? numOfEmp) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      newGroupTEXT.text.isNotEmpty ? groupTEXT = newGroupTEXT.text : null;
      isLoadingEmp = true;
      notifyListeners();
      try {
        await employeesFR
            .doc("$numOfEmp")
            .update(
              EmployeeModel(
                name: nameTEXT.text.trim(),
                phone: phoneTEXT.text.trim(),
                isAvailable: isDateTimeBetween(
                  parseDateTime(DateFormat().add_yMEd().format(DateTime.now())),
                  vacationFromTEXT,
                  vacationsToTEXT,
                ),
                group: groupTEXT ?? newGroupTEXT.text.trim(),
                vacationFrom: vacationFromTEXT,
                vacationsTo: vacationsToTEXT,
              ).toMap(),
            )
            .then((value) async => await _editEmployeeToGroup(numOfEmp))
            .catchError((er) => print("----> ::$er"));
        back();
      } catch (e) {
        print(e);
      }
      isLoadingEmp = false;
      notifyListeners();
    }
  }

  _editEmployeeToGroup(int? numOfEmp) {
    try {
      employeeInGroupFR
          .doc(groupTEXT)
          .collection(DateTime.now().millisecondsSinceEpoch.toString())
          .doc("$numOfEmp")
          .update(
            EmployeeModel(
              name: nameTEXT.text.trim(),
              phone: phoneTEXT.text.trim(),
              isAvailable: isDateTimeBetween(
                parseDateTime(DateFormat().add_yMEd().format(DateTime.now())),
                vacationFromTEXT,
                vacationsToTEXT,
              ),
              group: groupTEXT ?? newGroupTEXT.text.trim(),
              vacationFrom: vacationFromTEXT,
              vacationsTo: vacationsToTEXT,
            ).toMap(),
          );
    } catch (e) {
      print("----: $e");
    }
  }

  addNewGroup() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (newGroupTEXT.text.isNotEmpty) {
      isLoadingGro = true;
      groupTEXT = newGroupTEXT.text;
      notifyListeners();
      try {
        await groupsFR
            .doc(newGroupTEXT.text.trim())
            .set({"groupName": newGroupTEXT.text.trim()});
        _context.pop();
      } catch (e) {
        print(e);
      }
      isLoadingGro = false;
      notifyListeners();
      newGroupTEXT.clear();
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
