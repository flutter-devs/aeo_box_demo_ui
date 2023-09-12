import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgWidget extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? width;
  final VoidCallback? onTap;

  const CustomSvgWidget(
      this.assetName, {
        Key? key,
        this.color,
        this.width,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName,
        colorFilter:
        (color != null) ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        width: width,
      ),
    );
  }
}
