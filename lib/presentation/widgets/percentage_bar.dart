import 'package:aeo_box_demo_ui/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_text_style.dart';
import '../../core/constants/dimension_constants.dart';
import '../../core/helper/size_helper.dart';
import 'custom/custom_text.dart';

class PercentageBar extends StatefulWidget {
  final Color color;
  final double percentage;
  final Color color2;
  final double percentage2;
  final Color color3;
  final double percentage3;
  final Color color4;
  final double percentage4;
  final String title;
  final String title2;
  final String title3;
  final String title4;

  PercentageBar({
    required this.color,
    required this.percentage,
    required this.color2,
    required this.percentage2,
    required this.color3,
    required this.percentage3,
    required this.color4,
    required this.percentage4,
    required this.title,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  @override
  State<PercentageBar> createState() => _PercentageBarState();
}

class _PercentageBarState extends State<PercentageBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: Dimensions.px25,
              decoration: BoxDecoration(
                color: ColorConstants.emptyProgress,
                borderRadius: BorderRadius.circular(
                  Dimensions.px15,
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: widget.percentage / 100,
              child: Container(
                height: Dimensions.px25,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(
                    Dimensions.px15,
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: widget.percentage2 / 100,
              child: Container(
                height: Dimensions.px25,
                decoration: BoxDecoration(
                  color: widget.color2,
                  borderRadius: BorderRadius.circular(
                    Dimensions.px15,
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: widget.percentage3 / 100,
              child: Container(
                height: Dimensions.px25,
                decoration: BoxDecoration(
                  color: widget.color3,
                  borderRadius: BorderRadius.circular(
                    Dimensions.px15,
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: widget.percentage4 / 100,
              child: Container(
                height: Dimensions.px25,
                decoration: BoxDecoration(
                  color: widget.color4,
                  borderRadius: BorderRadius.circular(
                    Dimensions.px15,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizeHelper.h015(),
        Row(
          children: [
            _buildColorText(
              color: widget.color4,
              title: widget.title4,
            ),
            _buildColorText(
              color: widget.color3,
              title: widget.title3,
            ),
            _buildColorText(
              color: widget.color2,
              title: widget.title2,
            ),
            _buildColorText(
              color: widget.color,
              title: widget.title,
            ),
          ],
        ),
      ],
    );
  }

  _buildColorText({
    required Color color,
    required String title,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.px20),
                color: color),
          ),
          SizeHelper.w05(),
          CustomText(
            title,
            style: AppTextStyles.regularText(
              color: ColorConstants.grey,
              fontSize: Dimensions.px10,
            ),
          ),
        ],
      ),
    );
  }
}
