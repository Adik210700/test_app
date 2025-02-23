import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/home/domain/repository/character_repository_domain.dart';

class FetchAllCharactersUsecase {
  final CharacterRepositoryDomain repository;

  FetchAllCharactersUsecase({required this.repository});
  Future<List<CharecterEntity>> execute() async {
    return repository.fetchentities();
  }
}
