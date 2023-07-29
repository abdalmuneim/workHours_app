import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workhours/common/app_constant/app_constants.dart';
import 'package:workhours/generated/l10n.dart';

enum ValidationType {
  phone,
  name,
  cardNumber,
  notEmpty,
  email,
  ipAddress,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context, {
    int? length,
  }) {
    if (value == null) {
      return S.of(context).requiredField;
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return S.of(context).enterValidateEmail;
      }
    } else if (fieldType == ValidationType.password) {
      if (value.length < 6) {
        return S.of(context).enterValidatePassword;
      }
    } else if (fieldType == ValidationType.phone) {
      if (value.length != AppConstants.phoneLength) {
        return S.of(context).validPhone;
      }
    } else if (fieldType == ValidationType.name) {
      if (!RegExp(r'^[a-zA-zأ-ي\s]+$').hasMatch(value)) {
        return S.of(context).enterValidateName;
      }
    } else if (fieldType == ValidationType.validationCode) {
      if (value.isEmpty) {
        return S.of(context).requiredField;
      }
      if (value.length != AppConstants.codeLength) {
        return S.of(context).validateCodeNumber;
      }
    } else if (fieldType == ValidationType.name) {
      if (value.isEmpty) {
        return S.of(context).validName;
      }
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return S.of(context).requiredField;
      }
    }
    return null;
  }
}
