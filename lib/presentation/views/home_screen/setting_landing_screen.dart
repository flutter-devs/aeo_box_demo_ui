import 'package:aeo_box_demo_ui/core/constants/constant_imports.dart';
import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SettingLandingScreen extends StatelessWidget {
  const SettingLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.offWhite,
      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.px25,
              vertical: Dimensions.px10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Accounts',
                  style: AppTextStyles.boldText(
                    fontSize: Dimensions.px18,
                  ),
                ),
                SizeHelper.h05(),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.px15,
                      vertical: Dimensions.px10,
                    ),
                    child: Column(
                      children: [
                        _buildListView(
                            asset: IconConstants.profile2Icon,
                            title: 'shafquat@aeologic.com'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.profile2Icon,
                            title: 'shafquatmajid@aeologic.com'),
                      ],
                    ),
                  ),
                ),
                SizeHelper.h2(),
                CustomText(
                  'System',
                  style: AppTextStyles.boldText(
                    fontSize: Dimensions.px18,
                  ),
                ),
                SizeHelper.h05(),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.px15,
                      vertical: Dimensions.px10,
                    ),
                    child: Column(
                      children: [
                        _buildListView(
                            asset: IconConstants.lockIcon,
                            title: 'Privacy and Security'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.networkIcon,
                            title: 'Network Usage'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.bellIcon, title: 'Notification'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.cloudIcon, title: 'Backup'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.cellIcon, title: 'Default App'),
                        const Divider(
                          color: ColorConstants.greyOff,
                        ),
                        _buildListView(
                            asset: IconConstants.infoIcon, title: 'About'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildListView({
    required String asset,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px12,
        horizontal: Dimensions.px5,
      ),
      child: Row(
        children: [
          SvgPicture.asset(asset),
          SizeHelper.w2(),
          Expanded(
            child : CustomText(
              title,
              style: AppTextStyles.semiBoldText(
                fontSize: Dimensions.px16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
