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
import 'package:workhours/features/auth/presentations/providers/sign_in_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late SignInProvider read = context.read<SignInProvider>();
  late SignInProvider watch = context.watch<SignInProvider>();
  @override
  void initState() {
    super.initState();
    read.init();
  }

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
        titleCenter: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesWorkInProgress,
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
                    text: S.of(context).signIn,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  4.h.sh,

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
                  4.h.sh,

                  /// password
                  CustomTextFormField(
                    controller: watch.passwordTEXT,
                    obscureText: true,
                    border: true,
                    hintText: S.of(context).enterPassword,
                    labelText: S.of(context).password,
                    validator: (value) => AppValidator.validateFields(
                        value, ValidationType.password, context),
                  ),

                  TextButton(
                    onPressed: () => read.forgetPassword(),
                    child: Text(
                      S.of(context).doUForgetPassword,
                      style: TextStyle(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
            2.h.sh,

            /// sign in button
            watch.isLoading
                ? CircularProgressIndicator(color: AppColors.primary)
                : CustomElevatedButton(
                    onPressed: () => read.signIn(),
                    child: CustomText(
                      text: S.of(context).signIn,
                      fontWeight: FontWeightManger.semiBold,
                      fontSize: 14.sp,
                    ),
                  ),
            1.h.sh,

            /// not have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: S.of(context).notHaveAccount,
                ),
                TextButton(
                  onPressed: () => read.notHaveAccount(),
                  child: Text(
                    S.of(context).createAccount,
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
