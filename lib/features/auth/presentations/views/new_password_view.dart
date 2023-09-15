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
import 'package:workhours/features/auth/presentations/providers/new_password_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  late NewPasswordProvider read = context.read<NewPasswordProvider>();
  late NewPasswordProvider watch = context.watch<NewPasswordProvider>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          onPressBack: () => read.back(),
          heightAppBar: 80,
          backgroundColor: AppColors.scaffoldColor,
          CustomTitle: Image.asset(
            Assets.assetsImagesLogo,
            width: 50.w,
            height: 10.w,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.assetsImagesForgotPassword,
                width: 100.w,
              ),
              3.h.sh,

              /// form
              Form(
                key: watch.globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: S.of(context).changePassword,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    4.h.sh,

                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: watch.currentPasswordTEXT,
                      border: true,
                      hintText: S.of(context).currentPassword,
                      labelText: S.of(context).password,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.password, context),
                      obscureText: true,
                    ),

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

                    /// confirm new Passwor
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
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

                    2.h.sh,

                    /// save new password in button
                    watch.isLoading
                        ? CircularProgressIndicator(color: AppColors.primary)
                        : CustomElevatedButton(
                            onPressed: () => read.save(),
                            child: CustomText(
                              text: S.of(context).save,
                              fontWeight: FontWeightManger.semiBold,
                              fontSize: 14.sp,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
