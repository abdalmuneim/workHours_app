import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/app_constant/app_constants.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/feature_widget/drawer/view/drawer_view.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class ConnectWithUsView extends StatelessWidget {
  const ConnectWithUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor2,
        drawer: MyDrawer(),
        appBar: CustomAppBar(
          centerTitle: true,
          title: S.of(context).connectingWithUs,
          backButton: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.h.sh,
              Image.asset(
                Assets.assetsImagesContactUs,
                width: 100.w,
              ),
              2.h.sh,
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: AppColors.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: AppConstants.email,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: AppColors.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: AppConstants.phone,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: AppColors.primary,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: AppConstants.location,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
