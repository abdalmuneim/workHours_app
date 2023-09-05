import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/features/create_list/presentations/providers/create_list_provider.dart';
import 'package:workhours/features/home/data/model/employee_model.dart';
import 'package:workhours/generated/l10n.dart';

class ListOfEmployeesWidget extends StatelessWidget {
  const ListOfEmployeesWidget({
    super.key,
    required this.employees,
  });
  final List<EmployeeModel> employees;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).menuOfEmployees,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          2.h.sh,

          /// date
          Container(
            height: 30,
            width: 70.w,
            child: RichText(
              maxLines: 2,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10.sp,
                    ),
                children: [
                  TextSpan(
                    text: "${S.of(context).from} ",
                  ),
                  TextSpan(
                    text: Provider.of<CreateListProvider>(context).fromDate,
                  ),
                  TextSpan(
                    text: " ${S.of(context).to} ",
                  ),
                  TextSpan(
                    text: Provider.of<CreateListProvider>(context).toDate,
                  ),
                ],
              ),
            ),
          ),
          2.h.sh,

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: S.of(context).name,
                color: AppColors.darkGrey,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              CustomText(
                text: S.of(context).group,
                color: AppColors.darkGrey,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          1.h.sh,
          Divider(),
          1.h.sh,

          /// list
          Container(
            height: 70.h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 30),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                EmployeeModel emp = employees[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomText(
                        text: emp.name ?? "",
                        fontWeight: FontWeightManger.medium,
                        fontSize: 10.sp,
                      ),
                      CustomText(
                        text: emp.group ?? "",
                        fontWeight: FontWeightManger.medium,
                        fontSize: 10.sp,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          9.h.sh,
        ],
      ),
    );
  }
}
