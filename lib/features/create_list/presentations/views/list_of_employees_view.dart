import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_appbar.dart';
import 'package:workhours/common/widgets/custom_elevated_button.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/features/create_list/presentations/providers/list_of_employees_provider.dart';
import 'package:workhours/features/create_list/presentations/widgets/list_of_employees.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class ListOfEmployeesView extends StatefulWidget {
  const ListOfEmployeesView({super.key});

  @override
  State<ListOfEmployeesView> createState() => _ListOfEmployeesViewState();
}

class _ListOfEmployeesViewState extends State<ListOfEmployeesView> {
  late ListOfEmployeesProvider read = context.read<ListOfEmployeesProvider>();
  late ListOfEmployeesProvider watch = context.watch<ListOfEmployeesProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        heightAppBar: 10,
        fromScreen: RoutesStrings.createList,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// body
          RepaintBoundary(key: watch.widgetKey, child: ListOfEmployeesWidget()),

          /// share button
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
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    color: AppColors.white,
                    side: BorderSide(color: AppColors.darkGrey),
                    elevation: 0,
                    child: watch.isLoadShare
                        ? CircularProgressIndicator()
                        : Row(
                            children: [
                              SvgPicture.asset(
                                Assets.assetsImagesSvgWhatsappIc,
                                width: 6.w,
                              ),
                              CustomText(
                                text: S.of(context).shareWhatsApp,
                                fontWeight: FontWeightManger.regular,
                                fontSize: 12.sp,
                                color: AppColors.darkGrey,
                              ),
                            ],
                          ),
                    onPressed: watch.isLoadShare
                        ? null
                        : () => read.shareListOnWhatsApp(),
                  ),
                ),
                3.w.sw,
                Expanded(
                  child: CustomElevatedButton(
                    child: watch.isLoadSave
                        ? CircularProgressIndicator()
                        : CustomText(
                            text: S.of(context).saveList,
                            fontWeight: FontWeightManger.semiBold,
                            fontSize: 12.sp,
                          ),
                    onPressed: watch.isLoadSave ? null : () => read.saveList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
