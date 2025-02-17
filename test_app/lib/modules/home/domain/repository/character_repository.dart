import 'package:test_app/core/services/app_dio.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/home/domain/repository/character_repository_domain.dart';

class CharacterRepository extends CharacterRepositoryDomain {
  @override
  Future<List<CharecterEntity>> fetchentities() async {
    final response = await AppDio().dio.get('/en/characters');
    return response.data;
  }
}
