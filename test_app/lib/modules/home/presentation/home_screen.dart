import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/home/presentation/widgets/home_background_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_characters_list/home_characters_list_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_houses_widget/home_hauses_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_profile_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bakGroundColor,
        body: Stack(
          children: [
            HomeBackgroundWidget(),
            ListView(
              children: [
                HomeProfileWidgets(),
                AppDimensions.hugePaddinf.verticalSpace,
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppDimensions.mediumPaddinf),
                  child: Text(
                    'Hauses',
                    style: AppTextstyles.bodyBold
                        .copyWith(fontSize: 18, color: AppColors.textColor),
                  ),
                ),
                AppDimensions.mediumPaddinf.verticalSpace,
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppDimensions.mediumPaddinf),
                  child: HomeHausesWidget(),
                ),
                AppDimensions.hugePaddinf.verticalSpace,
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppDimensions.mediumPaddinf),
                  child: Text(
                    'Characters',
                    style: AppTextstyles.bodyBold
                        .copyWith(fontSize: 18, color: AppColors.textColor),
                  ),
                ),
                AppDimensions.largePaddinf.verticalSpace,
                HomeCharactersListWidget(),
              ],
            )
          ],
        ));
  }
}
