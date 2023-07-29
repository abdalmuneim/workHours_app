import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:workhours/generated/assets/assets.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelText,
    this.prefixIcon,
    this.filled = true,
    this.radius = 14,
    this.obscureText,
    this.border = true,
    this.suffixIcon,
    this.prefixIconColor = Colors.white,
    this.suffixIconColor = Colors.white,
    this.controller,
    this.textDirection,
    this.validator,
    this.onChange,
    this.maxLength,
    this.counterText,
    this.onSave,
    this.enabled,
    this.textAlign = TextAlign.start,
    this.isNumberOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofocus,
    this.onFieldSubmitted,
    this.width,
    this.height,
    this.contentPadding,
    this.focusNode,
    this.onTap,
    this.fillColor,
    this.borderRadius,
  }) : super(key: key);
  final int? maxLines, minLines;
  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor, fillColor;
  final bool? filled, obscureText;
  final bool border;
  final bool isNumberOnly;
  final bool? enabled;
  final TextAlign textAlign;
  final double radius;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSave;
  final int? maxLength;
  final double? width;
  final double? height;
  final String? counterText;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText = widget.obscureText ?? false;
  Color fillColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        onTap: () {
          setState(() {
            fillColor = AppColors.lightPrimary;
          });
        },
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        autofocus: widget.autofocus ?? false,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChange,
        onSaved: widget.onSave,
        textDirection: widget.textDirection,
        obscureText: obsecureText,
        obscuringCharacter: '*',
        keyboardType: widget.isNumberOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : widget.keyboardType,
        inputFormatters: widget.isNumberOnly
            ? [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ]
            : null,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counterText: widget.counterText,
          suffixIcon: widget.suffixIcon ?? toggleVisibility(),
          suffixIconColor: widget.suffixIconColor,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: widget.prefixIconColor,
          // contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.titleLarge,
          errorStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.red),
          filled: true,
          fillColor: widget.fillColor ?? fillColor,
          enabledBorder: widget.border
              ? OutlineInputBorder(
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(color: AppColors.grey.withOpacity(.3)),
                )
              : null,
          border: widget.border
              ? OutlineInputBorder(
                  borderRadius: widget.borderRadius ??
                      BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(color: AppColors.grey.withOpacity(.3)),
                )
              : null,
        ),
      ),
    );
  }

  toggleVisibility() {
    if (obsecureText) {
      return IconButton(
        icon: SvgPicture.asset(
          Assets.assetsImagesVisibilityOff,
        ),
        onPressed: () {
          setState(() {
            obsecureText = false;
          });
        },
      );
    } else if (widget.obscureText != null) {
      return IconButton(
        icon: Icon(
          Icons.visibility,
          color: AppColors.grey,
          size: 6.w,
        ),
        onPressed: () {
          setState(() {
            obsecureText = true;
          });
        },
      );
    } else {
      return null;
    }
  }
}
