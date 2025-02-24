import 'package:flutter/material.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';

class HomeProfileWidgets extends StatelessWidget {
  const HomeProfileWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Hi, Albus,',
        style: AppTextstyles.bodyBold
            .copyWith(color: AppColors.textColor, fontSize: 18),
      ),
      subtitle: Text(
        'See whats new today',
        style: AppTextstyles.bodyMedium
            .copyWith(color: AppColors.textColor.withOpacity(0.6)),
      ),
      trailing: ClipOval(
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqsFTMdBRWk94r-jZJ6z4NJ43D4SD84JkaLA&s'),
      ),
    );
  }
}
