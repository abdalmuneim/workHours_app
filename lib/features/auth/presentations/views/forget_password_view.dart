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
import 'package:workhours/features/auth/presentations/providers/forget_password_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late ForgetPasswordProvider read = context.read<ForgetPasswordProvider>();
  late ForgetPasswordProvider watch = context.watch<ForgetPasswordProvider>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
          heightAppBar: 80,
          onPressBack: () =>  read.back(),
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
                Assets.assetsImagesForgotPassword1,
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
                      text: S.of(context).forgetPassword,
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
                  ],
                ),
              ),
              2.h.sh,

              /// next  button
              watch.isLoading
                  ? CircularProgressIndicator(color: AppColors.primary)
                  : CustomElevatedButton(
                      onPressed: () => read.nextButton(),
                      child: CustomText(
                        text: S.of(context).next,
                        fontWeight: FontWeightManger.semiBold,
                        fontSize: 14.sp,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
