import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/styles.dart';

/// TextField Widget Custom
class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    this.controller,
    this.hint,
    this.isSecure = false,
    this.leadingIcon,
    this.autoApplyTrailing = false,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.width,
    this.hintColor,
    this.iconSearchColor,
    this.enable = true,
    this.onSubmit,
    this.onChanged,
    Key? key,
    this.textInputAction,
    this.autofocus = false,
    this.contentVerticalPadding,
    this.hintStyle,
    this.style,
    this.border,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.onTapScan,
    this.showSuffixIcon = true,
    this.showPrefixIcon = true,
    this.onTap,
    this.readOnly = false,
    this.onTapSearch,
    this.onEditingComplete,
    this.focusNode,
    this.validator,
    this.allowDispose = true,
    this.maxCharacter,
    this.keyboardType,
  }) : super(key: key);

  final bool autofocus;

  final TextEditingController? controller;

  /// [hint] placeholder text of textfield
  final String? hint;

  /// [leadingIcon] prefix icon
  final String? leadingIcon;

  /// [isSecure] show/hide input text
  final bool isSecure;

  /// [autoApplyTrailing] show/hide button toggle [isSecure]
  final bool autoApplyTrailing;

  final Color? backgroundColor;

  final double? borderRadius;

  final double? height;

  final double? width;

  final Color? hintColor;

  final Color? iconSearchColor;

  final bool? enable;

  final Function(String)? onSubmit;

  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;

  final double? contentVerticalPadding;

  final TextStyle? hintStyle;

  final TextStyle? style;

  final InputBorder? border;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final Color? prefixIconColor;

  final bool showSuffixIcon;

  final bool showPrefixIcon;

  final VoidCallback? onTapScan;

  final Function? onTap;

  final bool readOnly;

  final VoidCallback? onTapSearch;

  final VoidCallback? onEditingComplete;

  final FocusNode? focusNode;

  final String? Function(String?)? validator;

  final bool allowDispose;

  final int? maxCharacter;

  final TextInputType? keyboardType;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late bool isSecure;
  @override
  void initState() {
    super.initState();
    isSecure = widget.isSecure;
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.allowDispose) widget.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentPadding = widget.contentVerticalPadding ?? 8.h;
    UnderlineInputBorder border = UnderlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.borderRadius ?? 8.r)),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2.5,
      ),
    );
    return SizedBox(
      width: widget.width ?? double.maxFinite,
      height: widget.height,
      child: TextFormField(
        minLines: 1,
        maxLines: null,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.isSecure,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        autofocus: widget.autofocus,
        onFieldSubmitted: widget.onSubmit ?? (values) {},
        textAlignVertical: TextAlignVertical.center,
        readOnly: widget.readOnly,
        style: widget.style ??
            AppStyles.body2.copyWith(
              color: AppColors.black1,
              fontSize: 15.sp,
            ),
        decoration: InputDecoration(
          counterText: "",
          suffixIcon: widget.showSuffixIcon
              ? InkWell(
                  onTap: widget.onTapScan,
                  child: widget.suffixIcon ??
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Icon(
                          Icons.qr_code_scanner_outlined,
                          // size: 24.sp,
                          color: widget.prefixIconColor,
                        ),
                      ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(
            minWidth: 14.w,
            minHeight: 14.w,
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: widget.border ?? border,
          enabledBorder: widget.border ?? border,
          focusedBorder: widget.border ?? border,
          isDense: true,
          filled: true,
          fillColor: widget.backgroundColor ?? AppColors.black7,
          enabled: widget.enable ?? true,
          hintText: widget.hint,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 0.w, vertical: contentPadding),
          hintStyle: widget.hintStyle ??
              AppStyles.body2.copyWith(
                color: AppColors.black3,
                fontSize: 15.sp,
              ),
          labelStyle: AppStyles.subtitle2,
          prefixIcon: widget.showPrefixIcon
              ? InkWell(
                  onTap: widget.onTapSearch,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        13.w, contentPadding, 6.w, contentPadding),
                    child: widget.prefixIcon ??
                        Icon(
                          Icons.search,
                          size: 24.sp,
                          color: widget.prefixIconColor,
                        ),
                  ),
                )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: 14.w,
            minHeight: 14.w,
          ),
        ),
        onChanged: widget.onChanged,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        onEditingComplete: widget.onEditingComplete,
        validator: widget.validator,
        maxLength: widget.maxCharacter,
      ),
    );
  }
}
