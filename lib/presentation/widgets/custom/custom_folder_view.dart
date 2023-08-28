import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constant_imports.dart';
import 'custom_text.dart';

class CustomFolderView extends StatefulWidget {
  final String asset;
  final String title;
  final String subTitle;
  final bool borderEnabled;
  final Color fillColor;

  const CustomFolderView({
    super.key,
    required this.asset,
    required this.title,
    required this.subTitle,
    this.borderEnabled = false,
    this.fillColor = ColorConstants.transparent,
  });

  @override
  State<CustomFolderView> createState() => _CustomFolderViewState();
}

class _CustomFolderViewState extends State<CustomFolderView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor,
              border: Border.all(
                color: widget.borderEnabled
                    ? ColorConstants.greyOff
                    : ColorConstants.transparent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.px5,
            horizontal: Dimensions.px20,
          ),
          child: Row(
            children: [
              Container(
                color: ColorConstants.transparent,
                width: Dimensions.px60,
                child: Stack(
                  children: [
                    SvgPicture.asset(widget.asset),
                    Positioned(
                      bottom: -4,
                      right: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.px5),
                          decoration:
                              const BoxDecoration(color: ColorConstants.white),
                          child: SvgPicture.asset(
                            IconConstants.driveIcon,
                            // size: Dimensions.px20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      widget.title,
                      style: AppTextStyles.semiBoldText(),
                    ),
                    CustomText(
                      widget.subTitle,
                      style: AppTextStyles.regularText(
                        color: ColorConstants.grey,
                      ),
                    )
                  ],
                ),
              ),
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          Text('Share'),
                        ],
                      )),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.star_border),
                        Text('Add Favorite'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text('Trash'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: [
                        Icon(Icons.info_outline),
                        Text('Details'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizeHelper.h1(),
      ],
    );
  }
}
