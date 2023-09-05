import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/utils/utils.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/feature_widget/drawer/view/drawer_view.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/view/bottom_sheet_filter_by_group.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/custom_text_form_field.dart';
import 'package:workhours/features/home/data/model/base_data.dart';
import 'package:workhours/features/home/data/model/enums.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';
import 'package:workhours/features/home/presentations/views/widgets/impty_employee.dart';
import 'package:workhours/features/home/presentations/views/widgets/list_of_employees.dart';
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
      drawer: Consumer(builder: (context, d, _) {
        return MyDrawer();
      }),
      appBar: CustomAppBar(
        centerTitle: true,
        heightAppBar: 70,
        title: S.of(context).homePage,
        backButton: false,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomText(
                      text: S.of(context).menuOfEmployees,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),

                    /// add new employee
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
                Consumer<HomeProvider>(
                    builder: (context, value, child) => value.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : value.allEmployees.isEmpty
                            ? EmptyListEmployee(
                                onPress: () => read.navToAddNewEmployee(),
                              )
                            : Expanded(
                                child: ListOfEmployees(
                                    employees: value.allEmployees),
                              )),
                watch.allEmployees.isNotEmpty ? 10.h.sh : 0.w.sw,
              ],
            ),
          ),

          /// create list button
          Consumer<HomeProvider>(
            builder: (context, homePro, _) => homePro.allEmployees.isNotEmpty
                ? Container(
                    width: 100.w,
                    height: 10.h,
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
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
