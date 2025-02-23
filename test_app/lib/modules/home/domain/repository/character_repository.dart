import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_app/core/services/dio_settings.dart';
import 'package:test_app/modules/home/data/model/character_model.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/home/domain/repository/character_repository_domain.dart';

class CharacterRepository extends CharacterRepositoryDomain {
  final Dio dio;

  CharacterRepository({required this.dio});
  @override
  Future<List<CharecterEntity>> fetchentities() async {
    final response = await dio.get('/en/characters');
    final model = response.data as List<dynamic>;
    return model.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
