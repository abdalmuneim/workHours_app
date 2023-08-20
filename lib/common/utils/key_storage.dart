import 'package:cloud_firestore/cloud_firestore.dart';

class KeyStorage {
  static String get user => "User";
  static String get userUID => "uid";
}

class Collections {
  static String get users => "users";
  static String get employees => "Employees";
  static String get groups => "Groups";
  static String get employeesGroup => "Employees in Group";
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

final usersFR = _firestore.collection(Collections.users);
final groupsFR = _firestore.collection(Collections.groups);
final employeeInGroupFR = _firestore.collection(Collections.employeesGroup);
final employeesFR = _firestore.collection(Collections.employees);
