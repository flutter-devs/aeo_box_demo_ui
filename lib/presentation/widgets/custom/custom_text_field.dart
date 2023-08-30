import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/constant_imports.dart';

class CustomTextField extends StatefulWidget {
  final Color color;
  final bool isBorder;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscureText;
  final Color labelColor;
  final String labelText;
  final TextStyle? labelStyle;
  final String hintText;
  final TextInputType textInputType;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final EdgeInsets? customPadding;
  final FocusNode? focus;
  final bool showLimit;
  final String? Function(String?)? validator;
  final ValueSetter<String>? onChange;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final double borderRadius;
  final double borderWidth;
  final double paddingHorizontal;
  final double paddingVertical;

  const CustomTextField({
    super.key,
    this.isEnabled = true,
    this.color = ColorConstants.white,
    this.inputFormatters,
    this.isObscureText = false,
    this.labelColor = ColorConstants.black,
    this.labelText = '',
    this.hintText = '',
    this.labelStyle,
    this.textInputType = TextInputType.text,
    this.maxLength,
    this.maxLines = 1,
    this.isBorder = true,
    this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.customPadding,
    this.focus,
    this.showLimit = false,
    this.validator,
    this.onChange,
    this.onTap,
    this.isReadOnly = false,
    this.borderRadius = Dimensions.px12,
    this.borderWidth = 0.5,
    this.paddingHorizontal = Dimensions.px0,
    this.paddingVertical = Dimensions.px10,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isShowPassword = false;
  TextStyle? _labelStyle;
  TextStyle? _hintStyle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _isShowPassword = widget.isObscureText;
      });
    });
  }

  // _showHidePasswordIconTapped() {
  //   setState(() {
  //     _isShowPassword = !_isShowPassword;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final style =
        widget.style ?? AppTextStyles.regularText(fontSize: Dimensions.px17);
    _labelStyle = widget.labelStyle ??
        AppTextStyles.regularText(
          fontSize: Dimensions.px17,
          color: ColorConstants.grey,
        );
    _hintStyle = widget.labelStyle ??
        AppTextStyles.regularText(
          fontSize: Dimensions.px16,
          color: ColorConstants.grey,
        );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.paddingHorizontal,
        vertical: widget.paddingVertical,
      ),
      child: TextFormField(
        readOnly: widget.isReadOnly,
        enabled: widget.isEnabled,
        focusNode: widget.focus,
        controller: widget.textEditingController,
        inputFormatters: widget.inputFormatters,
        obscureText: _isShowPassword,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        style: style,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: Dimensions.px16,
            horizontal: Dimensions.px15,
          ),
          fillColor: widget.isEnabled ? widget.color : ColorConstants.greyOff,
          filled: true,
          enabled: widget.isEnabled,
          counterText: widget.showLimit ? null : '',
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          labelStyle: _labelStyle,
          // suffix: _getSuffixWidget(),
          hintText: widget.hintText,
          hintStyle: _hintStyle,
          border: _getInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: ColorConstants.grey,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: widget.borderWidth,
                color: ColorConstants.loginBtnClr,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          disabledBorder: _getInputBorder(),
        ),
        onChanged: widget.onChange,
        onTap: widget.onTap,
      ),
    );
  }

  InputBorder _getInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorConstants.grey,
        width: widget.borderWidth,
      ),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
  }

// Widget? _getSuffixWidget() {
//   return widget.isObscureText
//       ? GestureDetector(
//           onTap: _showHidePasswordIconTapped,
//           child: SvgPicture.asset(
//             _isShowPassword
//                 ? IconConstants.iconShowPasswordSvg
//                 : IconConstants.iconHidePasswordSvg,
//             height: Dimensions.px20,
//           ),
//         )
//       : null;
// }
}
