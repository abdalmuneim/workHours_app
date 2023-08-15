import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/generated/assets/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.heightAppBar = 50,
    this.fromScreen,
    this.CustomTitle,
    this.titleCenter = false,
    this.backgroundColor = AppColors.white,
    this.backButton = true,
    this.onPressBack,
    this.action,
  });
  final String? title;
  final double? heightAppBar;
  final String? fromScreen;
  final Widget? CustomTitle;
  final List<Widget>? action;
  final bool titleCenter;
  final Color? backgroundColor;
  final bool backButton;
  final void Function()? onPressBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: titleCenter,
      backgroundColor: backgroundColor,
      title: CustomTitle ??
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.labelMedium,
          ),
      actions: action,
      leading: backButton
          ? IconButton(
              icon: SvgPicture.asset(
                Assets.assetsImagesSvgArrowBackIc,
              ),
              onPressed: onPressBack ??
                  () => NavigationService.context
                      .pushReplacementNamed(fromScreen!),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar ?? 130);
}
