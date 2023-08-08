import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/helper/validator.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/view/bottom_sheet_filter_by_group.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/edit_employee_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class EditEmployeeView extends StatefulWidget {
  const EditEmployeeView({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  State<EditEmployeeView> createState() => _EditEmployeeViewState();
}

class _EditEmployeeViewState extends State<EditEmployeeView> {
  late EditEmployeeProvider read = context.read<EditEmployeeProvider>();
  late EditEmployeeProvider watch = context.watch<EditEmployeeProvider>();

  @override
  void initState() {
    super.initState();
    read.init(widget.employee);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      appBar: CustomAppBar(title: S.of(context).editEmployee),
      body: Form(
        key: watch.globalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: [
            /// name
            CustomTextFormField(
              keyboardType: TextInputType.name,
              controller: watch.nameTEXT,
              border: true,
              labelText: S.of(context).name,
              hintText: S.of(context).enterName,
              validator: (value) => AppValidator.validateFields(
                  value, ValidationType.name, context),
            ),
            4.h.sh,
            CustomText(
              text: S.of(context).group,
            ),

            /// choses group
            Row(
              children: [
                /// choses group
                Expanded(
                  child: CustomElevatedButton(
                    color: AppColors.white,
                    side: BorderSide(color: AppColors.veryLightGrey),
                    elevation: 0,
                    onPressed: () async {
                      final result = await Utils.showBottomSheet(
                        body: BottomSheetFilterByGroup<FilteringByGroupEnum>(
                          title: S.of(context).chosesGroup,
                          selectedValue: watch.groupTEXT,
                        ),
                      );
                      read.setFilterByGroup = await result;
                      print(read.filteringByGroup);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: watch.groupTEXT ?? S.of(context).chosesGroup,
                          color: AppColors.black,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.lightGrey,
                        )
                      ],
                    ),
                  ),
                ),
                4.w.sw,

                /// add new group
                Expanded(
                  child: CustomElevatedButton(
                    color: AppColors.white,
                    side: BorderSide(color: AppColors.darkGrey),
                    elevation: 0,
                    child: CustomText(
                      text: S.of(context).addNewGroup,
                      fontWeight: FontWeightManger.regular,
                      fontSize: 10.sp,
                      color: AppColors.darkGrey,
                    ),
                    onPressed: () {
                      Utils.showBottomSheetWithClose(
                        title: S.of(context).addGroup,
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomTextFormField(
                              labelText: S.of(context).groupName,
                            ),
                            2.h.sh,
                            CustomElevatedButton(
                              child: CustomText(
                                text: S.of(context).add,
                                fontWeight: FontWeightManger.semiBold,
                                fontSize: 14.sp,
                              ),
                              onPressed: () => read.back(),
                            ),
                            4.h.sh,
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            2.h.sh,

            /// Date time
            CustomText(
              text: "${S.of(context).vacations} ${S.of(context).optional}",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            1.h.sh,
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
                        watch.vacationFromTEXT != null
                            ? CustomText(
                                text: watch.vacationFromTEXT ?? "",
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
                        watch.vacationsToTEXT != null
                            ? CustomText(
                                text: watch.vacationsToTEXT ?? "",
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
            8.h.sh,

            ///
            Row(
              children: [
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
                      text: S.of(context).add,
                      fontWeight: FontWeightManger.semiBold,
                      fontSize: 14.sp,
                    ),
                    onPressed: () => read.editEmployee(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
