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
import 'package:workhours/features/auth/presentations/providers/sign_up_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late SignUpProvider read = context.read<SignUpProvider>();
  late SignUpProvider watch = context.watch<SignUpProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: false,
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
          children: <Widget>[
            Form(
              key: watch.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    text: S.of(context).createAccount,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  4.h.sh,

                  /// name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          keyboardType: TextInputType.text,
                          controller: watch.firstNameTEXT,
                          border: true,
                          hintText: S.of(context).enterFirstName,
                          labelText: S.of(context).firstName,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.name, context),
                        ),
                      ),
                      3.w.sw,
                      Expanded(
                        child: CustomTextFormField(
                          keyboardType: TextInputType.text,
                          controller: watch.lastNAmeTEXT,
                          border: true,
                          hintText: S.of(context).enterLastName,
                          labelText: S.of(context).lastName,
                          validator: (value) => AppValidator.validateFields(
                              value, ValidationType.name, context),
                        ),
                      ),
                    ],
                  ),
                  3.h.sh,

                  /// email
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: watch.emailTEXT,
                    border: true,
                    hintText: S.of(context).enterEmail,
                    labelText: S.of(context).email,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.email, context),
                  ),
                  3.h.sh,

                  /// password
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: watch.passwordTEXT,
                    border: true,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).password,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.password, context),
                    obscureText: true,
                  ),

                  3.h.sh,

                  /// confirm Password
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    controller: watch.confirmPasswordTEXT,
                    border: true,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).requiredField;
                      }
                      if (value != watch.passwordTEXT.text) {
                        return S.of(context).passwordsDoNotMatch;
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  4.h.sh,
                ],
              ),
            ),

            /// create account
            watch.isLoading
                ? CircularProgressIndicator(color: AppColors.primary)
                : CustomElevatedButton(
                    onPressed: () => read.signUp(),
                    child: CustomText(
                      text: S.of(context).createAccount,
                      fontWeight: FontWeightManger.semiBold,
                      fontSize: 14.sp,
                    ),
                  ),
            1.w.sh,

            /// have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: S.of(context).haveAccount,
                ),
                TextButton(
                  onPressed: () => read.haveAccount(),
                  child: Text(
                    S.of(context).signIn,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.black,
                        fontWeight: FontWeightManger.semiBold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
