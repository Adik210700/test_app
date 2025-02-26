import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/modules/home/presentation/provider/home_bg_provider.dart';

class HomeBackgroundWidget extends StatelessWidget {
  const HomeBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final providerW = context.watch<HomeBgProvider>();
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: Container(
            height: 1,
            width: 1,
            decoration: BoxDecoration(
                color: providerW.activeColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: providerW.activeColor.withOpacity(0.3),
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
                color: providerW.activeColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: providerW.activeColor.withOpacity(0.3),
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
