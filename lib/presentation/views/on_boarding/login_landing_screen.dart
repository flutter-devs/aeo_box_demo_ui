import 'package:aeo_box_demo_ui/core/helper/routing_helper.dart';
import 'package:aeo_box_demo_ui/core/helper/size_helper.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_plain_button.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_scaffold_safe_area.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/constant_imports.dart';

class LoginLandingScreen extends StatefulWidget {
  const LoginLandingScreen({super.key});

  @override
  State<LoginLandingScreen> createState() => _LoginLandingScreenState();
}

class _LoginLandingScreenState extends State<LoginLandingScreen> {
  bool isBtnClicked = false;

  _getStartedBtnTapped() {
    setState(() {
      isBtnClicked = !isBtnClicked;
    });
  }

  _loginBtnTapped() {
    RoutingHelper.pushToRouteNamed(
      ctx: context,
      routeName: RouteNames.signIn,
    );
  }

  _createNewBtnTapped() {
    RoutingHelper.pushToRouteNamed(
      ctx: context,
      routeName: RouteNames.signUp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      body: _buildBody(),
    );
  }



  _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.px30,
        vertical: Dimensions.px30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: Dimensions.px35),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(Dimensions.px150),
                    top: Radius.circular(Dimensions.px20),
                  ),
                  color: ColorConstants.loginBoxClr),
              height: SizeHelper.getDeviceWidth(context) / 2.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(Dimensions.px150),
                  top: Radius.circular(Dimensions.px20),
                ),
                child: SvgPicture.asset(
                  ImageConstants.loginSvg,
                ),
              ),
            ),
          ),
          SizeHelper.h6(),
          CustomText(
            StringConstants.loginMsg,
            style: AppTextStyles.boldText(
              fontSize: Dimensions.px35,
            ),
          ),
          SizeHelper.h2(),
          isBtnClicked == true
              ? _buildLoginBtn()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeHelper.getDeviceWidth(context) / 1.3,
                      child: CustomText(
                        StringConstants.dummyText,
                        style: AppTextStyles.regularText(
                          fontSize: Dimensions.px13,
                        ),
                      ),
                    ),
                    SizeHelper.h6(),
                    CustomPlainButton(
                      onTap: _getStartedBtnTapped,
                      width: SizeHelper.getDeviceWidth(context) / 2.8,
                      height: Dimensions.px60,
                      btnColor: ColorConstants.white,
                      label: 'Get Started',
                      style: AppTextStyles.boldText(fontSize: Dimensions.px15),
                      borderColor: ColorConstants.white,
                      borderRadius: Dimensions.px30,
                      boxShadow: kElevationToShadow[4],
                    ),
                  ],
                )
        ],
      ),
    );
  }

  _buildLoginBtn() {
    return Column(
      children: [
        CustomPlainButton(
          onTap: _loginBtnTapped,
          width: SizeHelper.getDeviceWidth(context),
          height: Dimensions.px60,
          btnColor: ColorConstants.white,
          label: StringConstants.login,
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px14),
          borderColor: ColorConstants.white,
          borderRadius: Dimensions.px30,
        ),
        SizeHelper.h1(),
        CustomPlainButton(
          onTap: () {},
          width: SizeHelper.getDeviceWidth(context) / 1.2,
          height: Dimensions.px60,
          btnColor: ColorConstants.loginBtnClr,
          label: StringConstants.loginSocial,
          style: AppTextStyles.semiBoldText(
            fontSize: Dimensions.px14,
            color: ColorConstants.white,
          ),
          borderColor: ColorConstants.white,
          borderRadius: Dimensions.px30,
        ),
        SizeHelper.h1(),
        CustomPlainButton(
          onTap: _createNewBtnTapped,
          width: SizeHelper.getDeviceWidth(context) / 1.2,
          height: Dimensions.px60,
          btnColor: ColorConstants.transparent,
          label: StringConstants.newLogin,
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px14),
          borderColor: ColorConstants.loginBtnClr,
          borderWidth: Dimensions.px2,
          borderRadius: Dimensions.px30,
        ),
      ],
    );
  }
}
