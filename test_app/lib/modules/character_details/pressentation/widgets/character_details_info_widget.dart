import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/core/extension/context_extension.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';

class CharacterDetailsInfoWidget extends StatelessWidget {
  const CharacterDetailsInfoWidget(
      {super.key, required this.character, required this.house});

  final CharecterEntity character;
  final HogeartsHouse house;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: AppDimensions.mediumPaddinf.paddingHorizontal,
        width: double.infinity,
        height: context.mq.height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              offset: Offset(5, -50),
              blurRadius: 100,
              spreadRadius: 50,
              color: Colors.black,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.fullName,
              style: AppTextstyles.bodyBold.copyWith(
                color: AppColors.textColor,
                fontSize: 25,
              ),
            ),
            AppDimensions.largePaddinf.verticalSpace,
            Text(
              character.hogwartsHouse,
              style: AppTextstyles.bodyMedium.copyWith(
                color: AppColors.textColor.withOpacity(0.5),
                fontSize: 20,
              ),
            ),
            AppDimensions.smallPaddinf.verticalSpace,
            Text(
              '${character.birthdate},${character.children}',
              style: AppTextstyles.bodyMedium.copyWith(
                color: house.color,
                fontSize: 20,
              ),
            ),
            AppDimensions.smallPaddinf.verticalSpace,
            Text(
              'Actor: ${character.interpretedBy}',
              style: AppTextstyles.bodyMedium.copyWith(
                color: house.color,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
