import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:workhours/features/profile/presentations/provider/profile_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileProvider read = context.read<ProfileProvider>();
  late ProfileProvider watch = context.watch<ProfileProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      appBar: CustomAppBar(
          onPressBack: () => read.back(), title: S.of(context).profile),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
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
          1.5.h.sh,

          /// change password
          Container(
            width: 100.w,
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => read.navToChangePassword(),
              child: Text(
                S.of(context).changePassword,
                textAlign: TextAlign.start,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.black,
                    fontWeight: FontWeightManger.semiBold),
              ),
            ),
          ),
          1.5.h.sh,

          /// buttons
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
                  onPressed: () => read.save(),
                ),
              ),
            ],
          ),
          3.h.sh,
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesSvgLogOut),
              TextButton(
                onPressed: () => read.logOut(),
                child: Text(
                  S.of(context).logOut,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.red,
                      fontWeight: FontWeightManger.semiBold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
