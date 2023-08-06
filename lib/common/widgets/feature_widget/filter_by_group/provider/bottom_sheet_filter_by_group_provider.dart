import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class BottomSheetFilterByGroupProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  FilteringByGroupEnum _selectedFilterByGroupEnum = FilteringByGroupEnum.All;
  late String _selectedFilterByGroup = groups[_selectedFilterByGroupEnum] ?? "";
  setByGroupEnum(FilteringByGroupEnum valueEnum, String valueString) {
    this._selectedFilterByGroupEnum = valueEnum;
    this._selectedFilterByGroup = valueString;

    notifyListeners();
  }

  FilteringByGroupEnum get getFilterByGroupEnum => _selectedFilterByGroupEnum;
  String get getFilterByGroup => _selectedFilterByGroup;

  back() {
    final Map<FilteringByGroupEnum, String> data = {
      _selectedFilterByGroupEnum: _selectedFilterByGroup,
    };
    print(data);
    _context.pop(data);
  }
}
