import 'package:flutter/material.dart';
import 'package:test_app/core/constans/app_dimensions.dart';
import 'package:test_app/core/extension/double_extension.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';

class HomeHouseElementWidget extends StatelessWidget {
  const HomeHouseElementWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap,
      required this.isActive,
      required this.activeColor});

  final String name;
  final String image;
  final Function() onTap;
  final bool isActive;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppDimensions.smallPaddinf.verticalSpace,
          Expanded(
            child: Container(
              height: 225,
              width: 150,
              decoration: BoxDecoration(
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          offset: Offset(1, 1),
                          spreadRadius: 2,
                          color: activeColor,
                          blurRadius: 15,
                        )
                      ]
                    : [],
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
              color: isActive ? activeColor : AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
