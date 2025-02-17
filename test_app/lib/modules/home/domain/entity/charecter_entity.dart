import 'dart:core';

//import 'package:test_app/core/enum/hogearts_house.dart';

class CharecterEntity {
  final String fullName;
  final String nickName;
  final String hogwartsHouse;
  final String interpretedBy;
  final List<String> children;
  final String image;
  final String birthdate;
  final int index;

  CharecterEntity(
      {required this.fullName,
      required this.nickName,
      required this.hogwartsHouse,
      required this.interpretedBy,
      required this.children,
      required this.image,
      required this.birthdate,
      required this.index});
}
