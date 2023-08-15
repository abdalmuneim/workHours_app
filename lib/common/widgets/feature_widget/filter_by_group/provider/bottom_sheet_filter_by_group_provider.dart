import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/generated/l10n.dart';

class BottomSheetFilterByGroupProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  String? _selectedFilterByGroup;
  setByGroup(String valueString) {
    this._selectedFilterByGroup = valueString;
    log(valueString);
    notifyListeners();
  }

  List<String> groups = [];
  List<String> getGroups() {
    groups.clear();
    final Stream<QuerySnapshot<Map<String, dynamic>>> data =
        FirebaseFirestore.instance.collection(Collections.groups).snapshots();
    data.forEach((e) {
      for (var data in e.docs) {
        groups.add(data["groupName"]);
      }
      groups.add(S.of(_context).all);
      notifyListeners();
    });
    groups.reversed;
    return groups;
  }

  String? get getFilterByGroup => _selectedFilterByGroup;

  back() {
    final data = _selectedFilterByGroup;
    print(data);
    _context.pop(data);
  }

  init({String? initVal}) async {
    if (initVal != null) {
      _selectedFilterByGroup = initVal;
    } else {
      _selectedFilterByGroup = S.of(_context).all;
    }
  }
}
