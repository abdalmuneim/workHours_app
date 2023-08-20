import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/view/bottom_sheet_filter_by_group.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/new_employee_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class NewEmployeeView extends StatefulWidget {
  const NewEmployeeView({super.key, required this.numOfEmp});
  final int numOfEmp;
  @override
  State<NewEmployeeView> createState() => _NewEmployeeViewState();
}

class _NewEmployeeViewState extends State<NewEmployeeView> {
  late NewEmployeeProvider read = context.read<NewEmployeeProvider>();
  late NewEmployeeProvider watch = context.watch<NewEmployeeProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      appBar: CustomAppBar(
        title: S.of(context).addEmployee,
        fromScreen: RoutesStrings.home,
      ),
      body: Form(
        key: watch.globalKey,
        child: Consumer<NewEmployeeProvider>(builder: (context, stat, _) {
          return ListView(
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
              2.h.sh,

              /// phone
              /* CustomTextFormField(
                keyboardType: TextInputType.phone,
                controller: watch.phoneTEXT,
                border: true,
                labelText: S.of(context).phone,
                hintText: S.of(context).enterPhone,
                maxLength: AppConstants.phoneLength,
                counterText: "",
                validator: (value) => AppValidator.validateFields(
                    value, ValidationType.phone, context),
              ), */
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
                              title: S.of(context).chosesGroup),
                        );
                        read.setFilterByGroup = await result;
                        print(read.filteringByGroup);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            text: watch.groupTEXT ?? S.of(context).chosesGroup,
                            color: AppColors.lightGrey,
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
                                  controller: stat.newGroupTEXT,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppValidator.validateFields(value,
                                          ValidationType.notEmpty, context);
                                    } else
                                      return S.of(context).validateNameAndPhone;
                                  },
                                ),
                                2.h.sh,
                                Consumer<NewEmployeeProvider>(
                                    builder: (context, isLoad, _) {
                                  return CustomElevatedButton(
                                    child: isLoad.isLoadingGro
                                        ? CircularProgressIndicator()
                                        : CustomText(
                                            text: S.of(context).add,
                                            fontWeight:
                                                FontWeightManger.semiBold,
                                            fontSize: 14.sp,
                                          ),
                                    onPressed: isLoad.isLoadingGro
                                        ? null
                                        : () => read.addNewGroup(),
                                  );
                                }),
                                4.h.sh,
                              ],
                            ));
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
              CustomElevatedButton(
                child: watch.isLoadingEmp
                    ? CircularProgressIndicator()
                    : CustomText(
                        text: S.of(context).add,
                        fontWeight: FontWeightManger.semiBold,
                        fontSize: 14.sp,
                      ),
                onPressed: watch.isLoadingEmp
                    ? null
                    : () => read.addEmployee(widget.numOfEmp),
              ),
            ],
          );
        }),
      ),
    );
  }
}
