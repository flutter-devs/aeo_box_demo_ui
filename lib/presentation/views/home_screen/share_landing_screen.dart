import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/menu_icon.dart';
import 'package:flutter_popup_menu_button/menu_item.dart';
import 'package:flutter_popup_menu_button/popup_menu_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/size_helper.dart';
import '../../widgets/custom/custom_scaffold_safe_area.dart';
import '../../widgets/custom/custom_text.dart';

class ShareLandingScreen extends StatefulWidget {
  const ShareLandingScreen({super.key});

  @override
  State<ShareLandingScreen> createState() => _ShareLandingScreenState();
}

class _ShareLandingScreenState extends State<ShareLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConstants.offWhite,
              ColorConstants.loginGradiantClrDark,
            ],
            stops: [0.1, 0.9],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSearchBar(),
            SizeHelper.h1(),
            _buildLowerBody(),
          ],
        ),
      ),
    );
  }

  _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimensions.px25,
        vertical: Dimensions.px10,
      ),
      decoration: const BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.px5,
          vertical: Dimensions.px0,
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: ColorConstants.offWhite,
              child: Icon(Icons.search),
            ),
            SizeHelper.w1(),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search file, photo or doc',
                hintStyle:
                    AppTextStyles.regularText(color: ColorConstants.grey),
              ),
            )),
          ],
        ),
      ),
    );
  }

  _buildLowerBody() {
    return Container(
      width: SizeHelper.getDeviceWidth(context),
      height: SizeHelper.getDeviceHeight(context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorConstants.white,
            ColorConstants.loginGradiantClrDark,
          ],
          stops: [0.1, 0.9],
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimensions.px25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.px20,
          vertical: Dimensions.px15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              'Category',
              style: AppTextStyles.boldText(
                fontSize: Dimensions.px18,
              ),
            ),
            SizeHelper.h1(),
            SizedBox(
              height: Dimensions.px120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquareContainer(
                    asset: IconConstants.docFolderIcon,
                    title: 'Documents',
                  ),
                  _buildSquareContainer(
                    asset: IconConstants.vidFolderIcon,
                    title: 'Videos',
                  ),
                  _buildSquareContainer(
                    asset: IconConstants.imgFolderIcon,
                    title: 'Images',
                  ),
                ],
              ),
            ),
            SizeHelper.h3(),
            CustomText(
              'Folder',
              style: AppTextStyles.boldText(
                fontSize: Dimensions.px18,
              ),
            ),
            SizeHelper.h1(),
            SizedBox(
              height: Dimensions.px120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquareContainer(
                      asset: IconConstants.shareFolderIcon,
                      title: 'Office files',
                      showPopup: true,
                      showShared: true),
                  _buildSquareContainer(
                      asset: IconConstants.shareFolderIcon,
                      title: 'Design videos',
                      showPopup: true,
                      showShared: true),
                  _buildSquareContainer(
                      asset: IconConstants.shareFolderIcon,
                      title: 'Images',
                      showPopup: true,
                      showShared: true),
                ],
              ),
            ),
            SizeHelper.h015(),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 30,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: List.generate(9, (index) {
                List<String>? titleList = [
                  'Office files',
                  'Design videos',
                  'Images'
                ];
                String title = titleList[index % titleList.length];
                return _buildSquareContainer(
                  asset: IconConstants.folderIcon,
                  title: title,
                  showPopup: true,
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  _buildSquareContainer({
    required String asset,
    bool showShared = false,
    required String title,
    bool showPopup = false,
  }) {
    return Column(
      children: [
        Container(
          height: SizeHelper.getDeviceHeight(context) * 0.12,
          width: SizeHelper.getDeviceWidth(context) * 0.28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.px20,
            ),
            color: ColorConstants.offWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimensions.px10,
              horizontal: Dimensions.px10,
            ),
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    asset,
                    height: Dimensions.px35,
                  ),
                ),
                if (showShared == true)
                  Positioned(
                    bottom: -6,
                    right: 0,
                    left: 0,
                    child: Image.asset(IconConstants.sharedPeople),
                  ),
                if (showPopup == true)
                  Positioned(
                    right: 0,
                    child: FlutterPopupMenuButton(
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
                  ),
              ],
            ),
          ),
        ),
        SizeHelper.h05(),
        Expanded(
          child: CustomText(
            title,
            style: AppTextStyles.regularText(
              color: ColorConstants.black,
              fontSize: Dimensions.px16,
            ),
          ),
        ),
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
