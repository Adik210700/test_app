import 'package:flutter/material.dart';
import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/character_details/pressentation/widgets/character_details_background.dart';
import 'package:test_app/modules/character_details/pressentation/widgets/character_details_info_widget.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen(
      {super.key, required this.character, required this.house});

  final CharecterEntity character;
  final HogeartsHouse house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CharacterDetailsBackground(
            image: character.image,
          ),
          SafeArea(
              child: BackButton(
            color: house.color,
            style: ButtonStyle(
              iconSize: WidgetStateProperty.all(30),
            ),
          )),
          CharacterDetailsInfoWidget(
            character: character,
            house: house,
          ),
        ],
      ),
    );
  }
}
