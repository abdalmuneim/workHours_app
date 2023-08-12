import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/helper/validator.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/features/profile/presentations/provider/change_password_provider.dart';
import 'package:workhours/generated/l10n.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late ChangePasswordProvider read = context.read<ChangePasswordProvider>();
  late ChangePasswordProvider watch = context.watch<ChangePasswordProvider>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor2,
        appBar: CustomAppBar(
          title: S.of(context).changePassword,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            /// form
            Form(
              key: watch.globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// old password
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: watch.oldPasswordTEXT,
                    border: true,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).oldPassword,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.password, context),
                    obscureText: true,
                  ),
                  3.h.sh,

                  /// new password
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: watch.newPasswordTEXT,
                    border: true,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).newPassword,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.password, context),
                    obscureText: true,
                  ),
                  3.h.sh,

                  /// confirm new Password
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: watch.confirmNewPasswordTEXT,
                    border: true,
                    labelText: S.of(context).confirmNewPassword,
                    hintText: S.of(context).confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).requiredField;
                      }
                      if (value != watch.newPasswordTEXT.text) {
                        return S.of(context).passwordsDoNotMatch;
                      }
                      return null;
                    },
                    obscureText: true,
                  ),

                  4.h.sh,

                  /// save new password button
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomElevatedButton(
                          color: AppColors.white,
                          side: BorderSide(color: AppColors.red),
                          elevation: 0,
                          child: CustomText(
                            text: S.of(context).cancel,
                            fontWeight: FontWeightManger.regular,
                            fontSize: 14.sp,
                            color: AppColors.red,
                          ),
                          onPressed: () => read.back(),
                        ),
                      ),
                      3.w.sw,
                      Expanded(
                        child: CustomElevatedButton(
                          child: CustomText(
                            text: S.of(context).save,
                            fontWeight: FontWeightManger.semiBold,
                            fontSize: 14.sp,
                          ),
                          onPressed: () => read.changePassword(),
                        ),
                      ),
                    ],
                  ),
                  3.h.sh,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
