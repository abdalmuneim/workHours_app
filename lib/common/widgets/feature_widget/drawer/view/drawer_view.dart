import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/routes/routes.dart';
import 'package:workhours/common/widgets/feature_widget/drawer/provider/drawer_provider.dart';
import 'package:workhours/generated/assets/assets.dart';
import 'package:workhours/generated/l10n.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late DrawerProvider read = context.read();
  late DrawerProvider watch = context.watch();
  @override
  void initState() {
    read.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Consumer<DrawerProvider>(
          builder: (context, DrawerProvider isRout, _) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 45),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                onTap: () => isRout.navTo(RoutesStrings.home),
                title: Text(
                  S.of(context).homePage,
                  style: isRout.getStyle(RoutesStrings.home).$1,
                ),
                visualDensity: VisualDensity.comfortable,
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.home,
                  color: isRout.getStyle(RoutesStrings.home).$2,
                ),
              ),
              ListTile(
                onTap: () => isRout.navTo(RoutesStrings.profile),
                title: Text(
                  S.of(context).profile,
                  style: isRout.getStyle(RoutesStrings.profile).$1,
                ),
                visualDensity: VisualDensity.comfortable,
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.person,
                  color: isRout.getStyle(RoutesStrings.profile).$2,
                ),
              ),
              ListTile(
                onTap: () => isRout.navTo(RoutesStrings.callUs),
                title: Text(
                  S.of(context).connectingWithUs,
                  style: isRout.getStyle(RoutesStrings.callUs).$1,
                ),
                visualDensity: VisualDensity.comfortable,
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.phone,
                  color: isRout.getStyle(RoutesStrings.callUs).$2,
                ),
              ),
              Spacer(),
              ListTile(
                onTap: () => read.logOut(),
                title: Text(S.of(context).logOut,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.red,
                        fontWeight: FontWeightManger.semiBold)),
                visualDensity: VisualDensity.comfortable,
                minLeadingWidth: 0,
                leading: SvgPicture.asset(
                  Assets.assetsImagesSvgLogOut,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
