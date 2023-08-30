import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_scaffold_safe_area.dart';
import 'package:aeo_box_demo_ui/presentation/widgets/custom/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/routing_helper.dart';
import '../../../core/helper/size_helper.dart';
import '../../../core/helper/validator_helper.dart';
import '../../widgets/custom/custom_plain_button.dart';
import '../../widgets/custom/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  _loginBtnTapped() {
    RoutingHelper.pushToRouteNamed(
      ctx: context,
      routeName: RouteNames.signIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      gradiantEnabled: false,
      body: Stack(children: [
        SvgPicture.asset(
          ImageConstants.loginBgSvg,
        ),
        Container(
          margin: const EdgeInsets.only(top: Dimensions.px100),
          child: _buildBody(),
        ),
      ]),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formGlobalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: Dimensions.px120),
              width: SizeHelper.getDeviceWidth(context),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.px20),
                  ),
                  color: ColorConstants.white),
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.px20,
                horizontal: Dimensions.px20,
              ),
              child: CustomText(
                StringConstants.signUp,
                style: AppTextStyles.boldText(
                  fontSize: Dimensions.px35,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorConstants.white,
                    ColorConstants.loginGradiantClrDark,
                  ],
                  stops: [0.1, 0.7],
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.px20,
                horizontal: Dimensions.px20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    borderWidth: Dimensions.px2,
                    borderRadius: Dimensions.px30,
                    labelText: StringConstants.enterName,
                    labelStyle: AppTextStyles.semiBoldText(
                      fontSize: Dimensions.px14,
                      color: ColorConstants.grey,
                    ),
                    validator: ValidateHelper.validateEmptyText,
                  ),
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
                    labelText: StringConstants.enterMobile,
                    labelStyle: AppTextStyles.semiBoldText(
                      fontSize: Dimensions.px14,
                      color: ColorConstants.grey,
                    ),
                    validator: ValidateHelper.validateEmptyText,
                  ),
                  CustomTextField(
                    borderWidth: Dimensions.px2,
                    borderRadius: Dimensions.px30,
                    labelText: StringConstants.enterNewPass,
                    labelStyle: AppTextStyles.semiBoldText(
                      fontSize: Dimensions.px14,
                      color: ColorConstants.grey,
                    ),
                    validator: ValidateHelper.validateEmptyPassword,
                  ),
                  SizeHelper.h6(),
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
          onTap: () {},
          width: SizeHelper.getDeviceWidth(context) / 1.2,
          height: Dimensions.px60,
          btnColor: ColorConstants.white,
          label: StringConstants.signUp,
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
          borderColor: ColorConstants.transparent,
          borderRadius: Dimensions.px30,
        ),
        SizeHelper.h1(),
        CustomPlainButton(
          onTap: _loginBtnTapped,
          width: SizeHelper.getDeviceWidth(context) / 1.2,
          height: Dimensions.px60,
          btnColor: ColorConstants.transparent,
          label:
              '${StringConstants.alreadyHaveAccount} ${StringConstants.signIn}',
          style: AppTextStyles.semiBoldText(fontSize: Dimensions.px14),
          borderColor: ColorConstants.loginBtnClr,
          borderWidth: Dimensions.px2,
          borderRadius: Dimensions.px30,
        ),
      ],
    );
  }
}
