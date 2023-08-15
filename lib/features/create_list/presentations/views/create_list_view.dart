import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/helper/validator.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/view/bottom_sheet_filter_by_group.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/features/create_list/presentations/providers/create_list_provider.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class CreateListView extends StatefulWidget {
  const CreateListView({super.key});

  @override
  State<CreateListView> createState() => _CreateListViewState();
}

class _CreateListViewState extends State<CreateListView> {
  late CreateListProvider read = context.read<CreateListProvider>();
  late CreateListProvider watch = context.watch<CreateListProvider>();

  @override
  void initState() {
    super.initState();
    read.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      appBar: CustomAppBar(
        title: S.of(context).createList,
        fromScreen: RoutesStrings.home,
      ),
      body: Form(
        key: watch.globalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            CustomText(
              text: S.of(context).group,
            ),

            /// choses group
            CustomElevatedButton(
              color: AppColors.white,
              side: BorderSide(color: AppColors.veryLightGrey),
              elevation: 0,
              onPressed: () async {
                final result = await Utils.showBottomSheet(
                  body: BottomSheetFilterByGroup<FilteringByGroupEnum>(
                      title: S.of(context).chosesGroup),
                );
                read.setFilterByGroup = await result;
                print(read.filteringByGroup);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: S.of(context).chosesGroup,
                    color: AppColors.lightGrey,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.lightGrey,
                  )
                ],
              ),
            ),
            2.h.sh,

            /// Date time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    label: S.of(context).fromDate,
                    color: AppColors.white,
                    side: BorderSide(color: AppColors.veryLightGrey),
                    elevation: 0,
                    onPressed: () => read.changeFromDateTime(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        watch.fromDateTEXT != null
                            ? CustomText(
                                text: watch.fromDateTEXT ?? "",
                                color: AppColors.lightGrey,
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            : CustomText(
                                text: S.of(context).chosesDate,
                                color: AppColors.lightGrey,
                              ),
                        SvgPicture.asset(Assets.assetsImagesSvgCalenderIc),
                      ],
                    ),
                  ),
                ),
                3.w.sw,
                Expanded(
                  child: CustomElevatedButton(
                    label: S.of(context).toDate,
                    color: AppColors.white,
                    side: BorderSide(color: AppColors.veryLightGrey),
                    elevation: 0,
                    onPressed: () => read.changeToDateTime(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        watch.toDateTEXT != null
                            ? CustomText(
                                text: watch.toDateTEXT ?? "",
                                color: AppColors.lightGrey,
                                style: Theme.of(context).textTheme.bodyLarge,
                              )
                            : CustomText(
                                text: S.of(context).chosesDate,
                                color: AppColors.lightGrey,
                              ),
                        SvgPicture.asset(Assets.assetsImagesSvgCalenderIc),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            2.h.sh,

            /// start From Num
            CustomTextFormField(
              keyboardType: TextInputType.text,
              controller: watch.startFromTEXT,
              border: true,
              isNumberOnly: true,
              labelText: S.of(context).startFromNum,
              hintText: S.of(context).enterNumOptional,
              validator: (value) => AppValidator.validateFields(
                  value, ValidationType.notEmpty, context),
            ),
            2.h.sh,

            ///
            CustomTextFormField(
              keyboardType: TextInputType.text,
              controller: watch.numOfHoursTEXT,
              border: true,
              isNumberOnly: true,
              labelText: S.of(context).numOfHours,
              hintText: S.of(context).enterNumOfHours,
              validator: (value) => AppValidator.validateFields(
                  value, ValidationType.notEmpty, context),
            ),
            6.h.sh,

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
                      text: S.of(context).createList,
                      fontWeight: FontWeightManger.semiBold,
                      fontSize: 14.sp,
                    ),
                    onPressed: () => read.createList(),
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
