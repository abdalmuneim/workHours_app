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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(100.w, 3.h), child: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesLogo,
              width: 50.w,
              height: 10.w,
            ),
            1.h.sh,
            Image.asset(
              Assets.assetsImagesWorkInProgress,
              width: 100.w,
            ),
            3.h.sh,

            /// form
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 100.w,
              child: Form(
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
                    CustomText(
                      text: S.of(context).email,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    .5.h.sh,
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: watch.emailTEXT,
                      border: true,
                      hintText: S.of(context).enterEmail,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.email, context),
                    ),
                    4.h.sh,

                    /// password
                    CustomText(
                      text: S.of(context).password,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    .5.h.sh,
                    CustomTextFormField(
                      controller: watch.passwordTEXT,
                      obscureText: true,
                      border: true,
                      hintText: S.of(context).enterPassword,
                      validator: (value) => AppValidator.validateFields(
                          value, ValidationType.password, context),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).doUForgetPassword,
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
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
