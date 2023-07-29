import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/helper/validator.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(100.w, 3.h),
        child: AppBar(
          leading: SizedBox(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Assets.assetsImagesLogo,
              width: 50.w,
              height: 10.w,
            ),
            4.h.sh,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 100.w,
              child: Form(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: S.of(context).firstName,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              1.w.sh,
                              CustomTextFormField(
                                keyboardType: TextInputType.text,
                                controller: watch.firstNameTEXT,
                                border: true,
                                hintText: S.of(context).enterFirstName,
                                validator: (value) =>
                                    AppValidator.validateFields(
                                        value, ValidationType.name, context),
                              ),
                            ],
                          ),
                        ),
                        3.w.sw,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: S.of(context).lastName,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              1.w.sh,
                              CustomTextFormField(
                                keyboardType: TextInputType.text,
                                controller: watch.lastNAmeTEXT,
                                border: true,
                                hintText: S.of(context).enterLastName,
                                validator: (value) =>
                                    AppValidator.validateFields(
                                        value, ValidationType.name, context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    /// email
                    3.h.sh,
                    CustomText(
                      text: S.of(context).email,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    1.w.sh,
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: watch.emailTEXT,
                      border: true,
                      hintText: S.of(context).enterEmail,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.email, context),
                    ),

                    /// password
                    3.h.sh,
                    CustomText(
                      text: S.of(context).password,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    1.w.sh,
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      controller: watch.passwordTEXT,
                      border: true,
                      hintText: S.of(context).enterPassword,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.password, context),
                      obscureText: true,
                    ),

                    /// confirm Password
                    3.h.sh,
                    CustomText(
                      text: S.of(context).confirmPassword,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    1.w.sh,
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: watch.confirmPasswordTEXT,
                      border: true,
                      hintText: S.of(context).enterPassword,
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
