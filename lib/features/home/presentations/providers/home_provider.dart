import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/auth/data/models/user_model.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/variable_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeVariableState state = HomeVariableState();

  BuildContext _context = NavigationService.context;

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) =>
      this._filteringByGroup = value;
  Map<FilteringByGroupEnum, String>? get filteringByGroup => _filteringByGroup;
  UserModel? user;
  List<EmployeeModel> allEmployees = [];
  List<EmployeeModel> availableEmployees = [];
  List<EmployeeModel> unavailableEmployees = [];

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
    setFilterByGroup =
        await {FilteringByGroupEnum.All: groups.values.toList().first};
  }
}
