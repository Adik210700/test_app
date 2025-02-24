import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';

class HomeHouseElementWidget extends StatelessWidget {
  const HomeHouseElementWidget(
      {super.key, required this.name, required this.image});

  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 225,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: AppDimensions.largeBorderRadius.circular,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
        AppDimensions.smallPaddinf.verticalSpace,
        Text(
          name,
          style: AppTextstyles.bodyMedium.copyWith(
            fontSize: 17,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
