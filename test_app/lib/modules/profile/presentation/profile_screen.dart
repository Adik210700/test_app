import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constans/app_dimensions.dart';

import 'package:test_app/core/extension/context_extension.dart';
import 'package:test_app/core/extension/double_extension.dart';

import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/theme/app_textstyles.dart';
import 'package:test_app/modules/profile/presentation/provider/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _userNameController = TextEditingController();
  final _userNameKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerW = context.watch<UserProvider>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
      body: Column(
        children: [
          Container(
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
                    providerW.name,
                    style: AppTextstyles.bodyBold
                        .copyWith(color: AppColors.textColor, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          AppDimensions.largePaddinf.verticalSpace,
          Padding(
            padding: AppDimensions.mediumPaddinf.paddingHorizontal,
            child: Form(
              key: _userNameKey,
              child: TextFormField(
                validator: (value) {
                  if ((value?.isEmpty ?? false) || value == '') {
                    return 'Please enter a vslid name';
                  }

                  return null;
                },
                controller: _userNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.smolBorderRadius),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.9), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.smolBorderRadius),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.9), width: 2),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.smolBorderRadius),
                    borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.9), width: 2),
                  ),
                ),
              ),
            ),
          ),
          AppDimensions.largePaddinf.verticalSpace,
          GestureDetector(
            onTap: () {
              if (_userNameKey.currentState?.validate() ?? false) {
                providerW.changeUserName(_userNameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You successfully changed youre name'),
                  ),
                );
              }
            },
            child: Padding(
              padding: AppDimensions.mediumPaddinf.paddingHorizontal,
              child: Container(
                height: AppDimensions.buttonHeight,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.9),
                    borderRadius: AppDimensions.smolBorderRadius.circular),
                child: Center(
                  child: Text('Change name',
                      style: AppTextstyles.bodyMedium.copyWith(
                        color: AppColors.textColor,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
