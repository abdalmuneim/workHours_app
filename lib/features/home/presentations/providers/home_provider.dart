import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/variable_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeVariableState state = HomeVariableState();

  BuildContext _context = NavigationService.context;

  Map<FilteringByGroupEnum, String>? _filteringByGroup;
  set setFilterByGroup(Map<FilteringByGroupEnum, String> value) =>
      this._filteringByGroup = value;
  Map<FilteringByGroupEnum, String>? get filteringByGroup => _filteringByGroup;

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

  init() async {
    setFilterByGroup =
        await {FilteringByGroupEnum.All: groups.values.toList().first};
  }
}
