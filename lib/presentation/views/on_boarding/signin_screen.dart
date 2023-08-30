import 'package:aeo_box_demo_ui/core/helper/validator_helper.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_scaffold_safe_area.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/routing_helper.dart';
import '../../../core/helper/size_helper.dart';
import '../../widgets/custom/custom_plain_button.dart';
import '../../widgets/custom/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  _createNewBtnTapped() {
    RoutingHelper.pushToRouteNamed(
      ctx: context,
      routeName: RouteNames.signUp,
    );
  }

  _loginBtnTapped() {
    final status = _formGlobalKey.currentState?.validate() ?? false;
    if (status) {
      RoutingHelper.pushToRouteNamed(
        ctx: context,
        routeName: RouteNames.dashboard,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      body: Stack(
        children: [
          SvgPicture.asset(
            ImageConstants.loginBgSvg,
          ),
          Container(
            margin: const EdgeInsets.only(top: Dimensions.px175),
    child: _buildBody(),
),
          //
        ],
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formGlobalKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.px30,
                vertical: Dimensions.px30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    IconConstants.signInIcon,
                    height: Dimensions.px80,
                  ),
                  SizeHelper.h1(),
                  CustomText(
                    StringConstants.signIn,
                    style: AppTextStyles.boldText(
                      fontSize: Dimensions.px35,
                    ),
                  ),
                  SizeHelper.h2(),
                  CustomTextField(
                    borderWidth: Dimensions.px2,
                    borderRadius: Dimensions.px30,
                    labelText: StringConstants.enterEmail,
                    labelStyle: AppTextStyles.semiBoldText(
                      fontSize: Dimensions.px14,
                      color: ColorConstants.grey,
                    ),
                    validator: ValidateHelper.validateEmail,
                  ),
                  CustomTextField(
                    borderWidth: Dimensions.px2,
                    borderRadius: Dimensions.px30,
                    labelText: StringConstants.enterPass,
                    labelStyle: AppTextStyles.semiBoldText(
                      fontSize: Dimensions.px14,
                      color: ColorConstants.grey,
                    ),
                    validator: ValidateHelper.validateEmptyPassword,
                  ),
                  SizeHelper.h2(),
                  _buildLoginBtn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLoginBtn() {
    return Column(
      children: [
        CustomPlainButton(
          onTap: _loginBtnTapped,
          width: SizeHelper.getDeviceWidth(context) / 1.2,
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
          label: '${StringConstants.noHaveAccount} ${StringConstants.newLogin}',
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px14),
          borderColor: ColorConstants.loginBtnClr,
          borderWidth: Dimensions.px2,
          borderRadius: Dimensions.px30,
        ),
      ],
    );
  }
}
