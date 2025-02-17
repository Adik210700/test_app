import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';

class CharacterModel extends CharecterEntity {
  CharacterModel(
      {required super.fullName,
      required super.nickName,
      required super.hogwartsHouse,
      required super.interpretedBy,
      required super.children,
      required super.image,
      required super.birthdate,
      required super.index});

  factory CharacterModel.fromJson(Map<String, dynamic> map) {
    return CharacterModel(
        fullName: map['fullName'] ?? '',
        nickName: map['nickName'] ?? '',
        hogwartsHouse: map['hogwartsHouse'] ?? ' ',
        interpretedBy: map['interpretedBy'] ?? '',
        children: map['children'] ?? [],
        image: map['image'] ?? '',
        birthdate: map['birthdate'] ?? '',
        index: map['index'] ?? 0);
  }
  HogeartsHouse parseHouse(String house) {
    switch (house) {
      case 'gryffindor':
        return HogeartsHouse.gryffindor;
      case 'hufflepuff':
        return HogeartsHouse.hufflepuff;
      case 'ravenclaw':
        return HogeartsHouse.ravenclaw;
      case 'slytherin':
        return HogeartsHouse.slytherin;

      default:
        return HogeartsHouse.unknown;
    }
  }
}
