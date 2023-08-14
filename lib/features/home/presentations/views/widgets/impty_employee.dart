import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class EmptyListEmployee extends StatelessWidget {
  const EmptyListEmployee({
    super.key,
    required this.onPress,
  });
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.assetsImagesUndrawNoData,
          ),
          3.h.sh,
          CustomText(
            text: S.of(context).emptyList,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          CustomText(
            text: S.of(context).plzAddEmployee,
            color: AppColors.veryLightGrey,
          ),
          3.h.sh,
          CustomElevatedButton(
              child: CustomText(
                text: S.of(context).addEmployee,
                fontWeight: FontWeightManger.semiBold,
                fontSize: 14.sp,
              ),
              onPressed: onPress),
        ],
      ),
    );
  }
}
