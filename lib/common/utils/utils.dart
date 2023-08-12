import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/services/navigation_services.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class Utils {
  static BuildContext get _context => NavigationService.context;

  /// bottom sheet
  static Future showBottomSheet(
          {required Widget body, Color? color = AppColors.white}) =>
      showModalBottomSheet(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: _context,
        builder: (BuildContext context) {
          return body;
        },
      );

  static Future showBottomSheetWithClose(
      {String? title, required Widget body}) {
    return showBottomSheet(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => _context.pop(),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                )),
            if (title != null)
              CustomText(
                text: title,
                style: Theme.of(_context).textTheme.labelMedium,
              ),
            3.h.sh,
            body,
          ],
        ),
      ),
    );
  }

  static showSuccess(String message) => showToast(message);

  static showError(String message) =>
      showToast(message, backgroundColor: AppColors.red);

  static showLottieDialog(
      {required String lottie, required String text, List<Widget>? action}) {
    return showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottie,
              ),
              10.sh,
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(_context).textTheme.labelSmall,
              ),
              20.sh,
              if (action != null) ...[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: action,
                  ),
                ),
                20.sh,
              ],
            ],
          ),
        ),
      ),
    );
  }

  static void showLoading({String? message}) {}

  /// toast
  static void showToast(String text,
          {Widget? icon,
          Color? backgroundColor,
          Color? textColor,
          int? duration}) =>
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(_context).size.width - 50,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: duration ?? 4),
          content: Expanded(
            child: Row(
              children: [
                if (icon != null) ...[
                  icon,
                  2.w.sw,
                ],
                CustomText(
                  text: text,
                  color: textColor ?? Colors.white,
                  fontSize: 10.sp,
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: backgroundColor ?? AppColors.black.withOpacity(0.7),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      );

  static displayDatePicker(ValueChanged<DateTime> onChange,
      {DateTime? initial, DateTime? selected}) async {
    var date = await showDialog(
      context: _context,
      // initialDate: selected ?? DateTime.now(),
      // firstDate: initial ?? DateTime.now(),
      // lastDate: DateTime(DateTime.now().year, DateTime.now().month + 2),
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
          ),
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          final width = constraints.maxWidth;
          // final height = constraints.maxHeight;

          return Center(
            child: Material(
              // ok or cancel buttons arent needed for this case, else you can use AlertDialog for general purpose
              child: SizedBox(
                width: width * 0.8, // cant managed being expanded
                child: CalendarDatePicker(
                  initialDate: selected ?? DateTime.now(),
                  firstDate: initial ?? DateTime.now(),
                  lastDate:
                      DateTime(DateTime.now().year, DateTime.now().month + 2),
                  onDateChanged: (DateTime value) {
                    _context.pop(value);
                    onChange(value);
                  },
                ),
              ),
            ),
          );
        }),
      ),
    );

    if (date != null) {
      onChange(date);
    }
  }
}
