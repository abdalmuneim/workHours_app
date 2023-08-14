import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/common/utils/extension.dart';
import 'package:workhours/common/widgets/custom_text.dart';
import 'package:workhours/common/widgets/feature_widget/filter_by_group/provider/bottom_sheet_filter_by_group_provider.dart';

class BottomSheetFilterByGroup<T> extends StatefulWidget {
  const BottomSheetFilterByGroup({
    super.key,
    required this.title,
    this.selectedValue,
  });

  final String title;
  final String? selectedValue;

  @override
  State<BottomSheetFilterByGroup<T>> createState() =>
      _BottomSheetFilterByGroupState<T>();
}

class _BottomSheetFilterByGroupState<T>
    extends State<BottomSheetFilterByGroup<T>> {
  late BottomSheetFilterByGroupProvider read =
      context.read<BottomSheetFilterByGroupProvider>();
  late BottomSheetFilterByGroupProvider watch =
      context.watch<BottomSheetFilterByGroupProvider>();
  @override
  void initState() {
    if (widget.selectedValue != null) {
      read.init(initVal: widget.selectedValue);
    }
    read.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomSheetFilterByGroupProvider>(
        builder: (context, filtering, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => read.back(),
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                        ),
                      )),
                  CustomText(
                    text: widget.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  3.h.sh,
                  ListView.builder(
                    itemCount: watch.groups.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final String? val = watch.groups[index];

                      return InkWell(
                        onTap: () => read.setByGroupEnum(val ?? ""),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              watch.getFilterByGroup == val
                                  ? Icon(
                                      Icons.check,
                                      color: AppColors.primary,
                                    )
                                  : 5.w.sw,
                              CustomText(
                                text: val ?? "",
                                color: watch.getFilterByGroup == val
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
            ));
  }
}
