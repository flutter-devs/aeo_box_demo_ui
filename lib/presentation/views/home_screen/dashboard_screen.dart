import 'package:aeo_box_demo_ui/core/constants/constant_imports.dart';
import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/files_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/home_screen/home_landing_screen.dart';
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
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _bottomNavBarIcons(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              title: 'Home',
              asset: _currentIndex == 0
                  ? IconConstants.homeSelectedIcon
                  : IconConstants.homeIcon,
            ),
            Expanded(
              child: _bottomNavBarIcons(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                title: 'Files',
                asset: _currentIndex == 1
                    ? IconConstants.filesSelectedIcon
                    : IconConstants.filesIcon,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildAppBar(),
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
            child: Center(
              child: CustomText('Share screen'),
            ),
          )
        else
          const Expanded(
            child: Center(
              child: CustomText('Setting screen'),
            ),
          )
      ],
    );
  }

  _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.px20,
        horizontal: Dimensions.px20,
      ),
      child: Row(
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
          Expanded(
            child: GestureDetector(
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
          ),
        ],
      ),
    );
  }

  _bottomNavBarIcons({
    required String asset,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            asset,
          ),
          CustomText(
            title,
            style: AppTextStyles.semiBoldText(
              color: ColorConstants.black,
            ),
          )
        ],
      ),
    );
  }
}
