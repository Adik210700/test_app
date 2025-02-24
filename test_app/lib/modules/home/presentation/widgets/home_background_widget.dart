import 'package:flutter/material.dart';
import 'package:test_app/core/theme/app_colors.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Container(
            height: 1,
            width: 1,
            decoration: BoxDecoration(
                color: AppColors.bakGroundBlureColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.bakGroundBlureColor.withOpacity(0.3),
                    spreadRadius: 300,
                    blurRadius: 200,
                  )
                ]),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 100,
          child: Container(
            height: 1,
            width: 1,
            decoration: BoxDecoration(
                color: AppColors.bakGroundBlureColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.bakGroundBlureColor.withOpacity(0.3),
                    spreadRadius: 300,
                    blurRadius: 200,
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
