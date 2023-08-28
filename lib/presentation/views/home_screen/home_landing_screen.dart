import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_folder_view.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_scaffold_safe_area.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';
import '../../widgets/custom/custom_plain_button.dart';

class HomeLandingScreen extends StatefulWidget {
  const HomeLandingScreen({super.key});

  @override
  State<HomeLandingScreen> createState() => _HomeLandingScreenState();
}

class _HomeLandingScreenState extends State<HomeLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildUpperBody(),
          SizeHelper.h1(),
          _buildLowerBody(),
        ],
      ),
    );
  }

  _buildUpperBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px10,
        horizontal: Dimensions.px10,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimensions.px20,
            ),
            color: ColorConstants.loginBtnClr),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.px20,
                vertical: Dimensions.px10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    'AeoBox',
                    style: AppTextStyles.semiBoldText(
                        color: ColorConstants.white, fontSize: Dimensions.px18),
                  ),
                  SizeHelper.w1(),
                  CustomText(
                    'Storage Usage',
                    style: AppTextStyles.semiBoldText(
                        color: ColorConstants.grey, fontSize: Dimensions.px10),
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorConstants.grey,
              thickness: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.px25,
                vertical: Dimensions.px5,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(Dimensions.px25),
                          left: Radius.circular(Dimensions.px25),
                        ),
                        color: ColorConstants.emptyProgress),
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.px25,
                    child: Row(
                      children: [
                        _buildColorContainer(
                          flex: 2,
                          containerColor: ColorConstants.progressGreen,
                        ),
                        _buildColorContainer(
                          flex: 2,
                          containerColor: ColorConstants.progressRed,
                        ),
                        _buildColorContainer(
                          flex: 2,
                          containerColor: ColorConstants.progressYellow,
                        ),
                        _buildColorContainer(
                          flex: 1,
                          containerColor: ColorConstants.progressGrey,
                        ),
                      ],
                    ),
                  ),
                  SizeHelper.h015(),
                  Row(
                    children: [
                      _buildColorText(
                        color: ColorConstants.progressGreen,
                        title: 'Document',
                      ),
                      _buildColorText(
                        color: ColorConstants.progressRed,
                        title: 'Videos',
                      ),
                      _buildColorText(
                        color: ColorConstants.progressYellow,
                        title: 'Photos',
                      ),
                      _buildColorText(
                        color: ColorConstants.progressGrey,
                        title: 'Others',
                      ),
                    ],
                  ),
                  SizeHelper.h3(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Total Space Used',
                              style: AppTextStyles.regularText(
                                color: ColorConstants.grey,
                                fontSize: Dimensions.px10,
                              ),
                            ),
                            CustomText(
                              '170 GB',
                              style: AppTextStyles.boldText(
                                color: ColorConstants.white,
                                fontSize: Dimensions.px18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomPlainButton(
                        onTap: () {},
                        width: MediaQuery.of(context).size.width / 3.6,
                        height: Dimensions.px50,
                        btnColor: ColorConstants.white,
                        label: 'Upgrade',
                        style:
                            AppTextStyles.boldText(fontSize: Dimensions.px15),
                        borderColor: ColorConstants.white,
                        borderRadius: Dimensions.px30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizeHelper.h05(),
            const Divider(
              color: ColorConstants.grey,
              thickness: 0.2,
            ),
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.px40,
                  vertical: Dimensions.px10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            'Available Space',
                            style: AppTextStyles.regularText(
                              color: ColorConstants.grey,
                              fontSize: Dimensions.px10,
                            ),
                          ),
                          CustomText(
                            '130 GB',
                            style: AppTextStyles.boldText(
                              color: ColorConstants.white,
                              fontSize: Dimensions.px18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: ColorConstants.grey,
                      thickness: 0.5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            'Total Space',
                            style: AppTextStyles.regularText(
                              color: ColorConstants.grey,
                              fontSize: Dimensions.px10,
                            ),
                          ),
                          CustomText(
                            '300 GB',
                            style: AppTextStyles.boldText(
                              color: ColorConstants.white,
                              fontSize: Dimensions.px18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildColorContainer({
    required Color containerColor,
    required int flex,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(Dimensions.px25),
            left: Radius.circular(Dimensions.px25),
          ),
          color: containerColor,
        ),
        height: Dimensions.px25,
      ),
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

  _buildLowerBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorConstants.white,
            ColorConstants.loginGradiantClrDark,
          ],
          stops: [0.4, 0.6],
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimensions.px25),
        ),
        // color: ColorConstants.white,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px20,
        horizontal: Dimensions.px20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  'Last Modified',
                  style: AppTextStyles.boldText(
                    fontSize: Dimensions.px18,
                  ),
                ),
              ),
              CustomText(
                'View All',
                style: AppTextStyles.regularText(
                  isUnderline: true,
                ),
              ),
            ],
          ),
          SizeHelper.h2(),
          const CustomFolderView(
            asset: IconConstants.adobeXdIcon,
            title: 'Shopping Mall App.xd',
            subTitle: '10 MB',
            borderEnabled: true,
          ),
          const CustomFolderView(
            asset: IconConstants.adobePsIcon,
            title: 'Edit Photo.psd',
            subTitle: '20 MB',
            borderEnabled: true,
          ),
          const CustomFolderView(
            asset: IconConstants.zipFolderIcon,
            title: 'Personal File.zip',
            subTitle: '20 MB',
            borderEnabled: true,
          ),
        ],
      ),
    );
  }
}
