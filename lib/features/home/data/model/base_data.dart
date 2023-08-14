import 'package:flutter/material.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/generated/l10n.dart';

BuildContext _context = NavigationService.context;

Map<FilteringByAvailableEnum, String> byAvailable = {
  FilteringByAvailableEnum.All: S.of(_context).all,
  FilteringByAvailableEnum.Available: S.of(_context).available,
  FilteringByAvailableEnum.UnAvailable: S.of(_context).unavailable,
};
