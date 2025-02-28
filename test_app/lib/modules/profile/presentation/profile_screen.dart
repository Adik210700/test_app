import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_app/core/extension/context_extension.dart';

import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/profile/presentation/provider/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerW = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.9),
        width: double.infinity,
        height: context.mq.height * 0.4,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 150,
                child: ClipOval(
                  child: Image.network(
                    providerW.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '${providerW.name}${providerW.surname}',
                style: AppTextstyles.bodyBold
                    .copyWith(color: AppColors.textColor, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
