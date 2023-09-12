import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/menu_icon.dart';
import 'package:flutter_popup_menu_button/menu_item.dart';
import 'package:flutter_popup_menu_button/popup_menu_button.dart';
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
              FlutterPopupMenuButton(
                shiftX: -50,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: ColorConstants.offWhite),
                popupMenuSize: const Size(160, 180),
                child: FlutterPopupMenuIcon(
                  key: GlobalKey(),
                  child: const Icon(Icons.more_vert),
                ),
                children: [
                  FlutterPopupMenuItem(
                    closeOnItemClick: false,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimensions.px10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.share_outlined,
                                size: 18,
                              ),
                              SizeHelper.w1(),
                              CustomText(
                                'Share',
                                style: AppTextStyles.semiBoldText(),
                              ),
                            ],
                          ),
                        ),
                        _customDivider(),
                      ],
                    ),
                  ),
                  FlutterPopupMenuItem(
                    closeOnItemClick: false,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimensions.px10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_border,
                                size: 18,
                              ),
                              SizeHelper.w1(),
                              CustomText(
                                'Add Favorite',
                                style: AppTextStyles.semiBoldText(),
                              ),
                            ],
                          ),
                        ),
                        _customDivider(),
                      ],
                    ),
                  ),
                  FlutterPopupMenuItem(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimensions.px10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.delete_outlined,
                                size: 18,
                              ),
                              SizeHelper.w1(),
                              CustomText(
                                'Trash',
                                style: AppTextStyles.semiBoldText(),
                              ),
                            ],
                          ),
                        ),
                        _customDivider(),
                      ],
                    ),
                  ),
                  FlutterPopupMenuItem(
                    closeOnItemClick: false,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimensions.px10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info_outline,
                                size: 18,
                              ),
                              SizeHelper.w1(),
                              CustomText(
                                'Details',
                                style: AppTextStyles.semiBoldText(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizeHelper.h1(),
      ],
    );
  }

  _customDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.px10,
      ),
      child: Divider(
        thickness: 0.5,
        color: ColorConstants.greyOff,
      ),
    );
  }
}
