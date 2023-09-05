import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:workhours/common/helper/date_time.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/provider/bottom_sheet_filter_by_group_provider.dart';
import 'package:workhours/features/auth/data/models/user_model.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/variable_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeVariableState state = HomeVariableState();

  BuildContext _context = NavigationService.context;
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  String? _filteringByGroup;
  set setFilterByGroup(String value) => this._filteringByGroup = value;
  String? get filteringByGroup => _filteringByGroup;
  UserModel? user;
  List<EmployeeModel> allEmployees = [];
  List<EmployeeModel> availableEmployees = [];
  List<EmployeeModel> unavailableEmployees = [];
  bool isLoading = false;

  _updateAvailableEmployees() async {
    final event = await _firebase.collection(Collections.employees).get();
    event.docs.forEach((e) async {
      final emp = EmployeeModel.fromMap(e.data());
      log("before: ${emp.isAvailable}");
      await _update(emp);
    });
  }

  Future<List<EmployeeModel>> getAllEmployees() async {
    allEmployees.clear();
    availableEmployees.clear();
    unavailableEmployees.clear();
    isLoading = true;
    notifyListeners();

    final event = await _firebase.collection(Collections.employees).get();
    event.docs.forEach((e) async {
      final emp = EmployeeModel.fromMap(e.data());
      log("after: ${emp.isAvailable}");
      allEmployees.add(emp);
      if (emp.isAvailable!) {
        availableEmployees.add(emp);
      } else {
        unavailableEmployees.add(emp);
      }
    });

    isLoading = false;
    notifyListeners();
    return allEmployees;
  }

  onChangeSelectFilterAvailable(
      FilteringByAvailableEnum filterEnum, String? value) {
    try {
      state.setByAvailableEnum(filterEnum, value!);
    } catch (e) {
      Utils.showError(e.toString());
    }
    notifyListeners();
  }

  navToCreateList() {
    _context.pushReplacementNamed(RoutesStrings.createList,
        extra: availableEmployees);
  }

  navToAddNewEmployee() {
    _context.pushReplacementNamed(RoutesStrings.newEmployee,
        queryParams: {"numOfEmp": "${allEmployees.length}"});
  }

  navToEditEmployee(EmployeeModel employee) {
    _context.pushReplacementNamed(
      RoutesStrings.editEmployee,
      queryParams: {
        "employee": employee.toJson(),
        "numOfEmp": allEmployees.length.toString()
      },
    );
  }

  navToProfile() {
    _context.pushReplacementNamed(RoutesStrings.profile);
  }

  onReorder(int oldIndex, int newIndex) {
    notifyListeners();
  }

  init() async {
    await _updateAvailableEmployees();
    getAllEmployees();

    await Provider.of<BottomSheetFilterByGroupProvider>(_context, listen: false)
        .getGroups();
    Future.delayed(
      Duration(milliseconds: 300),
      () async => setFilterByGroup =
          await Provider.of<BottomSheetFilterByGroupProvider>(_context,
                  listen: false)
              .groups
              .first,
    );
  }

  _update(EmployeeModel emp) async {
    await employeesFR.doc(emp.id.toString()).update({
      "isAvailable": await isDateTimeBetween(
          parseDateTime(DateFormat().add_yMEd().format(DateTime.now())),
          emp.vacationFrom,
          emp.vacationsTo)
    });
  }
}
