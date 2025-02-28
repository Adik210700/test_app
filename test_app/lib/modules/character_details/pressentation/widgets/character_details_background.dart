import 'package:flutter/material.dart';
import 'package:test_app/core/extension/context_extension.dart';

class CharacterDetailsBackground extends StatelessWidget {
  const CharacterDetailsBackground({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.mq.height * 0.8,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
