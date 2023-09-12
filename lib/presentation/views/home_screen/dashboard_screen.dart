import 'package:aeo_box_demo_ui/core/constants/constant_imports.dart';
import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/files_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/home_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/setting_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/share_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_svg_widget.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: Dimensions.px120,
        width: Dimensions.px80,
        child: FloatingActionButton(
          shape: const CircleBorder(
              // borderRadius: BorderRadius.zero
              ),
          onPressed: () {},
          backgroundColor: ColorConstants.loginBtnClr,
          tooltip: 'js',
          child: SvgPicture.asset(
              IconConstants.centerFABIcon), //icon inside button
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: ColorConstants.white,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        //shape of notch
        notchMargin: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.px4),
              child: Row(
                //children inside bottom appbar
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _bottomNavBarIcons(
                    onTap: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    title: 'Home',
                    asset: IconConstants.homeIcon,
                    color: _currentIndex == 0
                        ? ColorConstants.black
                        : ColorConstants.grey,
                    textColor: _currentIndex == 0
                        ? ColorConstants.black
                        : ColorConstants.grey,
                  ),
                  Expanded(
                    child: _bottomNavBarIcons(
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      title: 'Files',
                      asset: IconConstants.filesIcon,
                      color: _currentIndex == 1
                          ? ColorConstants.black
                          : ColorConstants.grey,
                      textColor: _currentIndex == 1
                          ? ColorConstants.black
                          : ColorConstants.grey,
                    ),
                  ),
                  SizeHelper.w4(),
                  Expanded(
                    child: _bottomNavBarIcons(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      title: 'Share',
                      asset: IconConstants.shareIcon,
                      color: _currentIndex == 2
                          ? ColorConstants.black
                          : ColorConstants.grey,
                      textColor: _currentIndex == 2
                          ? ColorConstants.black
                          : ColorConstants.grey,
                    ),
                  ),
                  _bottomNavBarIcons(
                    onTap: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                    title: 'Setting',
                    asset: IconConstants.settingIcon,
                    color: _currentIndex == 3
                        ? ColorConstants.black
                        : ColorConstants.grey,
                    textColor: _currentIndex == 3
                        ? ColorConstants.black
                        : ColorConstants.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ColorConstants.offWhite,
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return _currentIndex != 3
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildUserAppBar(),
              if (_currentIndex == 0)
                const Expanded(
                  child: HomeLandingScreen(),
                )
              else if (_currentIndex == 1)
                const Expanded(
                  child: FilesLandingScreen(),
                )
              else if (_currentIndex == 2)
                const Expanded(
                  child: ShareLandingScreen(),
                ),
            ],
          )
        : Column(
            children: [
              _buildSettingAppBar(),
              const Expanded(child: SettingLandingScreen()),
            ],
          );
  }

  _buildUserAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px20,
        horizontal: Dimensions.px20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.px80 / 2),
              child: Container(
                height: Dimensions.px60,
                width: Dimensions.px60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.white,
                ),
                child: SvgPicture.asset(
                  IconConstants.profileIcon,
                  fit: BoxFit.scaleDown,
                  height: Dimensions.px20,
                  width: Dimensions.px20,
                ),
              ),
            ),
          ),
          SizeHelper.w015(),
          Expanded(
            child: CustomText(
              'AeoBox',
              style: AppTextStyles.boldText(fontSize: Dimensions.px30),
            ),
          ),
          SizeHelper.w4(),
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.px60 / 2),
              child: Container(
                height: Dimensions.px60,
                width: Dimensions.px60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.white,
                ),
                child: SvgPicture.asset(
                  IconConstants.bellIcon,
                  fit: BoxFit.scaleDown,
                  height: Dimensions.px20,
                  width: Dimensions.px20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildSettingAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px20,
        horizontal: Dimensions.px20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomText(
              'Settings',
              style: AppTextStyles.boldText(fontSize: Dimensions.px30),
            ),
          ),
          SizeHelper.w6(),
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.px60 / 2),
              child: Container(
                height: Dimensions.px60,
                width: Dimensions.px60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.white,
                ),
                child: SvgPicture.asset(
                  IconConstants.bellIcon,
                  fit: BoxFit.scaleDown,
                  height: Dimensions.px20,
                  width: Dimensions.px20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomNavBarIcons({
    required String asset,
    required String title,
    Color textColor = ColorConstants.grey,
    Color color = ColorConstants.grey,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CustomSvgWidget(
            asset,
            color: color,
          ),
          CustomText(
            title,
            style: AppTextStyles.semiBoldText(
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
