import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/context_extension.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/home/presentation/bloc/fetch_all_characters_bloc.dart';
import 'package:test_app/modules/home/presentation/widgets/home_background_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_characters_list/home_characters_list_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_houses_widget/home_hauses_widget.dart';
import 'package:test_app/modules/home/presentation/widgets/home_profile_widgets.dart';
import 'package:test_app/modules/profile/presentation/profile_screen.dart';

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
                GestureDetector(
                    onTap: () {
                      context.push(const ProfileScreen());
                    },
                    child: HomeProfileWidgets()),
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
                  child: BlocBuilder<FetchAllCharactersBloc, AppState>(
                      builder: (context, state) {
                    if (state is LoadingState) {
                      return Row(
                        children: [
                          Text(
                            'Characters',
                            style: AppTextstyles.bodyBold.copyWith(
                                fontSize: 18, color: AppColors.textColor),
                          ),
                          AppDimensions.smallPaddinf.horizontalSpace,
                          const SizedBox(
                              height: 20,
                              width: 20,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              )),
                        ],
                      );
                    }
                    if (state is SuccessState) {
                      return Text(
                        'Characters(${state.characters.length})',
                        style: AppTextstyles.bodyBold
                            .copyWith(fontSize: 18, color: AppColors.textColor),
                      );
                    }
                    return Text(
                      'Characters',
                      style: AppTextstyles.bodyBold
                          .copyWith(fontSize: 18, color: AppColors.textColor),
                    );
                  }),
                ),
                AppDimensions.largePaddinf.verticalSpace,
                HomeCharactersListWidget(),
              ],
            )
          ],
        ));
  }
}
