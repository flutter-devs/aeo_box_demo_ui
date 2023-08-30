import 'package:flutter/material.dart';
import '../../../core/constants/constant_imports.dart';

//ignore: must_be_immutable
class CustomPlainButton extends StatelessWidget {
  Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  Color? btnColor;
  final bool isExpanded;
  final Color lblColor;
  final VoidCallback? onTap;
  final String label;
  final TextStyle? style;
  final double? height;
  final double paddingHorizontal;
  final double paddingVertical;
  final IconData? icon;
  final Color iconColor;
  final double? width;
  final List<BoxShadow>? boxShadow;

  CustomPlainButton({
    this.borderColor,
    this.borderRadius = Dimensions.px10,
    this.borderWidth = Dimensions.px0,
    this.btnColor,
    this.height,
    this.icon,
    this.isExpanded = false,
    this.lblColor = ColorConstants.white,
    this.label = '',
    this.onTap,
    this.style,
    this.paddingHorizontal = Dimensions.px14,
    this.paddingVertical = Dimensions.px14,
    this.iconColor = ColorConstants.white,
    this.width,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          border: Border.all(
              color: borderColor ?? ColorConstants.black, width: borderWidth),
          color: btnColor ?? ColorConstants.black,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: (icon != null)
            ? Row(
                children: [
                  isExpanded
                      ? Expanded(child: _buildTextPart())
                      : _buildTextPart(),
                  Icon(
                    icon,
                    color: iconColor,
                    size: Dimensions.px25,
                  ),
                ],
              )
            : isExpanded
                ? Expanded(child: _buildTextPart())
                : _buildTextPart(),
      ),
    );
  }

  _buildTextPart() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.px5),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: style ??
            AppTextStyles.mediumText(
              color: lblColor,
              fontSize: Dimensions.px18,
            ),
      ),
    );
  }
}
