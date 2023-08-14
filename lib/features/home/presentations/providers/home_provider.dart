import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllEmployees() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> data =
        _firebase.collection(Collections.employees).snapshots();
    data.forEach((e) {
      for (var data in e.docs) {
        allEmployees.add(
          EmployeeModel.fromMap(
            data.data(),
          ),
        );
      }
      notifyListeners();
    });
    return data;
  }

  _getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String>? u = await preferences.getStringList(KeyStorage.user);
    user = UserModel(firstName: u![0]);
    notifyListeners();
  }

  onChangeSelectFilterAvailable(
      FilteringByAvailableEnum filterEnum, String? value) {
    print(filterEnum);
    print(value);
    try {
      state.setByAvailableEnum(filterEnum, value!);
    } catch (e) {
      Utils.showError(e.toString());
    }
    notifyListeners();
  }

  navToCreateList() {
    _context.pushNamed(RoutesStrings.createList);
  }

  navToAddNewEmployee() {
    _context.pushNamed(RoutesStrings.newEmployee,
        queryParams: {"numOfEmp": "${allEmployees.length}"});
  }

  navToEditEmployee(EmployeeModel employee) {
    _context.pushNamed(
      RoutesStrings.editEmployee,
      queryParams: {"employee": employee.toJson()},
    );
  }

  navToProfile() {
    _context.pushReplacementNamed(RoutesStrings.profile);
  }

  onReorder(int oldIndex, int newIndex) {
    notifyListeners();
  }

  init() async {
    await _getUser();
    await getAllEmployees();
    await Provider.of<BottomSheetFilterByGroupProvider>(_context, listen: false)
        .getGroups();
    setFilterByGroup = await Provider.of<BottomSheetFilterByGroupProvider>(
            _context,
            listen: false)
        .groups
        .first;
  }
}
