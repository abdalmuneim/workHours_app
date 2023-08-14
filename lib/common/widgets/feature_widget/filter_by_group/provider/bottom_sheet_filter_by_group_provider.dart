import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/key_storage.dart';
import 'package:workhours/generated/l10n.dart';

class BottomSheetFilterByGroupProvider extends ChangeNotifier {
  BuildContext _context = NavigationService.context;

  late String _selectedFilterByGroup = groups[0];
  setByGroupEnum(String valueString) {
    this._selectedFilterByGroup = valueString;

    notifyListeners();
  }

  List<String> groups = [];
  Future<List<String>> getGroups() async {
    final Stream<QuerySnapshot<Map<String, dynamic>>> data =
        await FirebaseFirestore.instance
            .collection(Collections.groups)
            .snapshots();

    await for (var e in data) {
      for (var data in e.docs) {
        log("${data.data()}");
        groups.add(data["groupName"]);
      }
      return groups;
    }
    notifyListeners();
    return groups;
  }

  String get getFilterByGroup => _selectedFilterByGroup;

  back() {
    final data = _selectedFilterByGroup;
    print(data);
    _context.pop(data);
  }

  init({String? initVal}) async {
    groups.add(S.of(_context).all);
    await getGroups();
    if (initVal != null) {
      await groups.map((value) {
        if (initVal == value) {
          this._selectedFilterByGroup = value;
        }
        return value;
      });
    } else {}
  }
}
