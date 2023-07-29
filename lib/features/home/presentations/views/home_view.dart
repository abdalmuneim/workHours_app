import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/generated/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(100.w, 1.h), child: AppBar()),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  S.of(context).welcomeO("محمد"),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Card(
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
              ],
            ),
            4.h.sh,

            /// add new employee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(
                  text: S.of(context).menuOfEmployees,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                InkWell(
                  onTap: () {},
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
              text: "الكلي (300) المتوفر (100) الغير متوفر (200)",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
