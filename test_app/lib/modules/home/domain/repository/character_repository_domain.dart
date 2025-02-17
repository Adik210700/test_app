import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';

abstract class CharacterRepositoryDomain {
  CharacterRepositoryDomain();
  Future<List<CharecterEntity>> fetchentities();
}
