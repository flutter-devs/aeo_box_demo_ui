import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/size_helper.dart';
import '../../widgets/custom/custom_folder_view.dart';
import '../../widgets/custom/custom_scaffold_safe_area.dart';
import '../../widgets/custom/custom_text.dart';

class FilesLandingScreen extends StatefulWidget {
  const FilesLandingScreen({super.key});

  @override
  State<FilesLandingScreen> createState() => _FilesLandingScreenState();
}

class _FilesLandingScreenState extends State<FilesLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      gradiantEnabled: false,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildUpperBody(),
          SizeHelper.h1(),
          _buildLowerBody(),
        ],
      ),
    );
  }

  _buildLowerBody() {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.px100,
      ),
      width: MediaQuery.of(context).size.width,
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
        // color: ColorConstants.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.px20,
          vertical: Dimensions.px10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Cloud Storage',
              style: AppTextStyles.boldText(
                fontSize: Dimensions.px18,
              ),
            ),
            SizeHelper.h1(),
            Row(
              children: [
                _buildSquareContainer(
                  color: ColorConstants.driveBox,
                  asset: IconConstants.driveIcon,
                  title: 'Google Drive',
                ),
                SizeHelper.w1(),
                _buildSquareContainer(
                  color: ColorConstants.progressRed,
                  asset: IconConstants.megaIcon,
                  title: 'Mega Box',
                ),
              ],
            ),
            SizeHelper.h2(),
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    'Recent Files',
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
            SizeHelper.h1(),
            const CustomFolderView(
              asset: IconConstants.adobeXdIcon,
              title: 'Shopping Mall App.xd',
              subTitle: '10 MB',
              fillColor: ColorConstants.white,
            ),
            const CustomFolderView(
              asset: IconConstants.adobePsIcon,
              title: 'Edit Photo.psd',
              subTitle: '20 MB',
              fillColor: ColorConstants.white,
            ),
            const CustomFolderView(
              asset: IconConstants.zipFolderIcon,
              title: 'Personal File.zip',
              subTitle: '20 MB',
              fillColor: ColorConstants.white,
            ),
          ],
        ),
      ),
    );
  }

  _buildSquareContainer({
    required Color color,
    required String asset,
    required String title,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.px20,
          ),
          color: color,
        ),
        height: 150,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.px10,
            horizontal: Dimensions.px10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.px30),
                child: Container(
                  padding: const EdgeInsets.all(Dimensions.px8),
                  decoration: const BoxDecoration(
                    color: ColorConstants.white,
                  ),
                  child: SvgPicture.asset(
                    asset,
                    height: Dimensions.px35,
                  ),
                ),
              ),
              SizeHelper.h1(),
              CustomText(
                title,
                style: AppTextStyles.semiBoldText(
                  color: ColorConstants.white,
                  fontSize: Dimensions.px16,
                ),
              ),
              SizeHelper.h1(),
            ],
          ),
        ),
      ),
    );
  }
}
