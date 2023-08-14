import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/enums.dart';

class HomeVariableState {
  FilteringByGroupEnum _selectedFilterByGroupEnum = FilteringByGroupEnum.All;
  // late String? _selectedFilterByGroup = groups[_selectedFilterByGroupEnum];
  setByGroupEnum(FilteringByGroupEnum valueEnum, String valueString) {
    this._selectedFilterByGroupEnum = valueEnum;
    // this._selectedFilterByGroup = valueString;
  }

  FilteringByGroupEnum get getFilterByGroupEnum => _selectedFilterByGroupEnum;
  // String? get getFilterByGroup => _selectedFilterByGroup;

  FilteringByAvailableEnum _selectedFilterByAvailableEnum =
      FilteringByAvailableEnum.All;
  late String? _selectedFilterByAvailable =
      byAvailable[_selectedFilterByAvailableEnum];
  setByAvailableEnum(FilteringByAvailableEnum valueEnum, String valueString) {
    this._selectedFilterByAvailableEnum = valueEnum;
    this._selectedFilterByAvailable = valueString;
  }

  FilteringByAvailableEnum get getFilterByAvailableEnum =>
      _selectedFilterByAvailableEnum;
  String? get getFilterByAvailable => _selectedFilterByAvailable;
}
