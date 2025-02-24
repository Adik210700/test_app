import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';

class HomeCharactersListElementWidget extends StatelessWidget {
  const HomeCharactersListElementWidget({super.key, required this.character});

  final CharecterEntity character;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: AppDimensions.largeBorderRadius.circular),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.mediumPaddinf),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppDimensions.mediumBorderRadius.circular,
              child: Image.network(character.image),
            ),
            AppDimensions.mediumPaddinf.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    character.fullName,
                    style: AppTextstyles.bodySemibold
                        .copyWith(color: AppColors.textColor, fontSize: 18),
                  ),
                  Text(
                    character.birthdate,
                    style: AppTextstyles.bodyMedium.copyWith(
                        color: AppColors.textColor.withOpacity(0.6),
                        fontSize: 16),
                  ),
                  Text(
                    character.hogwartsHouse,
                    style: AppTextstyles.bodyMedium.copyWith(
                        color: AppColors.textColor.withOpacity(0.6),
                        fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
