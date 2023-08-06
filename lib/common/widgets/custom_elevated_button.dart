import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/resources/font_manager.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.color = AppColors.primary,
    this.borderRadius = 14,
    required this.child,
    this.side = BorderSide.none,
    this.maximumSize,
    this.minimumSize,
    this.isCircle = false,
    this.elevation,
    this.padding,
    this.label,
  }) : super(key: key);
  final void Function()? onPressed;
  final Color? color;
  final double borderRadius;
  final BorderSide side;
  final Size? maximumSize;
  final Size? minimumSize;
  final bool isCircle;
  final String? label;
  final double? elevation;
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          CustomText(
            text: label ?? "",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          .5.h.sh,
        ],
        ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(padding),
              elevation: MaterialStateProperty.all(elevation),
              maximumSize: MaterialStateProperty.all(maximumSize),
              minimumSize: MaterialStateProperty.all(minimumSize),
              backgroundColor: MaterialStateProperty.all(
                color,
              ),
              textStyle: MaterialStateProperty.all(TextStyle(
                color: AppColors.black,
                fontFamily: FontManager.fontFamily,
                fontSize: 16.sp,
              )),
              shape: isCircle
                  ? MaterialStateProperty.all<CircleBorder>(
                      CircleBorder(side: side),
                    )
                  : MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                          side: side),
                    ),
            ),
            onPressed: onPressed,
            child: child),
      ],
    );
  }
}
