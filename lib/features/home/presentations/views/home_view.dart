import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/view/bottom_sheet_filter_by_group.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';
import 'package:workhours/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeProvider read = context.read<HomeProvider>();
  late HomeProvider watch = context.watch<HomeProvider>();

  @override
  void initState() {
    super.initState();
    read.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor2,
      appBar: CustomAppBar(
        heightAppBar: 70,
        title: S.of(context).welcomeO(watch.user?.firstName ?? ""),
        backButton: false,
        action: [
          GestureDetector(
            onTap: () => read.navToProfile(),
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person_2_outlined,
                  color: AppColors.primary,
                  size: 6.w,
                ),
              ),
            ),
          ),
          2.w.sw,
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// add new employee
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomText(
                      text: S.of(context).menuOfEmployees,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    InkWell(
                      onTap: () => read.navToAddNewEmployee(),
                      borderRadius: BorderRadius.circular(50),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 3.w,
                            backgroundColor: AppColors.primary,
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                          1.w.sw,
                          CustomText(
                            text: S.of(context).addNewEmployee,
                            fontWeight: FontWeightManger.regular,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                2.h.sh,

                /// all, available and not available employees
                CustomText(
                  text: S.of(context).counterEmployees(
                      watch.allEmployees.length,
                      watch.availableEmployees.length,
                      watch.unavailableEmployees.length),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                2.h.sh,

                /// search
                CustomTextFormField(
                  prefixIcon: Icon(Icons.search),
                  hintText: S.of(context).search,
                ),
                2.w.sh,

                /// groups and available
                Row(
                  children: <Widget>[
                    /// group
                    CustomElevatedButton(
                      minimumSize: Size(35.w, 50),
                      maximumSize: Size(35.w, 50),
                      color: AppColors.white,
                      side: BorderSide(color: AppColors.veryLightGrey),
                      elevation: 0,
                      onPressed: () async {
                        final result = await Utils.showBottomSheet(
                          body: BottomSheetFilterByGroup<FilteringByGroupEnum>(
                              title: S.of(context).filterByGroup),
                        );
                        if (result != null) {
                          read.setFilterByGroup = await result;
                          print(read.filteringByGroup);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            text: S.of(context).group,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.lightGrey,
                          )
                        ],
                      ),
                    ),
                    2.w.sw,

                    /// available
                    CustomElevatedButton(
                      minimumSize: Size(35.w, 50),
                      maximumSize: Size(35.w, 50),
                      color: AppColors.white,
                      side: BorderSide(color: AppColors.veryLightGrey),
                      elevation: 0,
                      onPressed: () {
                        Utils.showBottomSheet(
                          body: Consumer<HomeProvider>(
                              builder: (context, filtering, child) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 5.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              icon: Icon(
                                                Icons.close,
                                                color: AppColors.black,
                                              ),
                                            )),
                                        CustomText(
                                          text: S.of(context).filterByGroup,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        3.h.sh,
                                        ListView.builder(
                                          itemCount: byAvailable.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final List<FilteringByAvailableEnum>
                                                keys =
                                                byAvailable.keys.toList();
                                            final val =
                                                byAvailable[keys[index]];
                                            final FilteringByAvailableEnum key =
                                                keys[index];

                                            return InkWell(
                                              onTap: () => read
                                                  .onChangeSelectFilterAvailable(
                                                      key, val),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  children: [
                                                    watch.state.getFilterByAvailable ==
                                                            val
                                                        ? Icon(
                                                            Icons.check,
                                                            color: AppColors
                                                                .primary,
                                                          )
                                                        : 5.w.sw,
                                                    CustomText(
                                                      text: val ?? "",
                                                      color: watch.state
                                                                  .getFilterByAvailable ==
                                                              val
                                                          ? AppColors.primary
                                                          : AppColors.darkGrey,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            text: S.of(context).available,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.lightGrey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                2.w.sh,

                /// list of employees
                Expanded(
                  child: watch.allEmployees.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contact_emergency_outlined,
                                color: AppColors.veryLightGrey,
                                size: 10.h,
                              ),
                              3.h.sh,
                              CustomText(
                                text: S.of(context).noEmployeeYet,
                                color: AppColors.veryLightGrey,
                              ),
                            ],
                          ),
                        )
                      : ReorderableListView.builder(
                          onReorder: read.onReorder,
                          itemCount: 0,
                          itemBuilder: (context, index) {
                            final employee = EmployeeModel(
                              name: "محمد احمد",
                              group: "مجموعة أ",
                            );
                            return Card(
                              key: ValueKey(index),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: null,
                                    icon: Icon(
                                      Icons.menu,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      1.h.sh,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// employee id
                                          CircleAvatar(
                                            radius: 3.w,
                                            backgroundColor: AppColors.primary,
                                            child: CustomText(
                                              textAlign: TextAlign.center,
                                              text: (index + 1).toString(),
                                              color: AppColors.white,
                                            ),
                                          ),
                                          2.w.sw,

                                          /// employee data
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 70.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    /// employee name
                                                    Row(
                                                      children: [
                                                        CustomText(
                                                          text: "محمد احمد",
                                                          fontWeight:
                                                              FontWeightManger
                                                                  .medium,
                                                          fontSize: 14.sp,
                                                        ),
                                                        3.w.sw,

                                                        /// employee state
                                                        Icon(
                                                          Icons.circle,
                                                          color: index >= 2
                                                              ? AppColors
                                                                  .unActive
                                                              : AppColors
                                                                  .active,
                                                          size: 12,
                                                        ),
                                                        .5.w.sw,
                                                        CustomText(
                                                          text: index >= 2
                                                              ? S
                                                                  .of(context)
                                                                  .unavailable_text
                                                              : S
                                                                  .of(context)
                                                                  .available_text,
                                                          color: index >= 2
                                                              ? AppColors
                                                                  .unActive
                                                              : AppColors
                                                                  .active,
                                                          fontWeight:
                                                              FontWeightManger
                                                                  .regular,
                                                        ),
                                                      ],
                                                    ),

                                                    /// edit employee
                                                    IconButton(
                                                      onPressed: () => read
                                                          .navToEditEmployee(
                                                              employee),
                                                      icon: Icon(
                                                        Icons.edit,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              1.h.sh,

                                              /// employee group
                                              CustomText(
                                                text: S.of(context).groupA,
                                                color: AppColors.darkGrey,
                                                fontSize: 10.sp,
                                              ),
                                              1.h.sh,

                                              /// employee vac
                                              Container(
                                                height: 30,
                                                width: 70.w,
                                                child: RichText(
                                                  maxLines: 2,
                                                  text: TextSpan(
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          fontSize: 10.sp,
                                                        ),
                                                    children: [
                                                      TextSpan(
                                                        text: S
                                                            .of(context)
                                                            .vacations,
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            "${S.of(context).from} ",
                                                      ),
                                                      TextSpan(
                                                        text: "الاحد 1/9/2023",
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            " ${S.of(context).to} ",
                                                      ),
                                                      TextSpan(
                                                        text: "الخميس 4/9/2023",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      1.h.sh,
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),

          /// create list button
          Container(
            width: 100.w,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightGrey,
                  offset: Offset(
                    0,
                    1,
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: CustomElevatedButton(
              child: CustomText(
                text: S.of(context).createList,
                fontWeight: FontWeightManger.semiBold,
                fontSize: 14.sp,
              ),
              onPressed: () => read.navToCreateList(),
            ),
          )
        ],
      ),
    );
  }
}
