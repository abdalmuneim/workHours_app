import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/features/home/presentations/providers/home_provider.dart';
import 'package:workhours/generated/l10n.dart';

class ListOfEmployees extends StatelessWidget {
  const ListOfEmployees({
    super.key,
    required this.employees,
  });

  final List<EmployeeModel> employees;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, employeePro, _) {
      return ReorderableListView.builder(
        onReorder: Provider.of<HomeProvider>(context, listen: false).onReorder,
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    1.h.sh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// employee id
                        CircleAvatar(
                          radius: 3.w,
                          backgroundColor: AppColors.primary,
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: employee.id.toString(),
                            color: AppColors.white,
                          ),
                        ),
                        2.w.sw,

                        /// employee data
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// employee name
                                  Row(
                                    children: [
                                      CustomText(
                                        text: employee.name ?? "",
                                        fontWeight: FontWeightManger.medium,
                                        fontSize: 14.sp,
                                      ),
                                      3.w.sw,

                                      /// employee state
                                      Icon(
                                        Icons.circle,
                                        color: employee.isAvailable!
                                            ? AppColors.unActive
                                            : AppColors.active,
                                        size: 12,
                                      ),
                                      .5.w.sw,
                                      CustomText(
                                        text: employee.isAvailable!
                                            ? S.of(context).unavailable_text
                                            : S.of(context).available_text,
                                        color: employee.isAvailable!
                                            ? AppColors.unActive
                                            : AppColors.active,
                                        fontWeight: FontWeightManger.regular,
                                      ),
                                    ],
                                  ),

                                  /// edit employee
                                  IconButton(
                                    onPressed: () => Provider.of<HomeProvider>(
                                            context,
                                            listen: false)
                                        .navToEditEmployee(employee),
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// employee group
                            CustomText(
                              text: employee.group!,
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
                                      text: S.of(context).vacations,
                                    ),
                                    TextSpan(
                                      text: " ${S.of(context).from} ",
                                    ),
                                    TextSpan(
                                      text: employee.vacationFrom,
                                    ),
                                    TextSpan(
                                      text: " ${S.of(context).to} ",
                                    ),
                                    TextSpan(
                                      text: employee.vacationsTo,
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
      );
    });
  }
}
