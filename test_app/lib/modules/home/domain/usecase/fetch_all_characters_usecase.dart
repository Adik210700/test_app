import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/home/domain/repository/character_repository_domain.dart';

class FetchAllCharactersUsecase {
  final CharacterRepositoryDomain repository;

  FetchAllCharactersUsecase({required this.repository});
  Future<List<CharecterEntity>> execute(String? house) async {
    final characters = await repository.fetchentities();
    return _sortCharacters(characters: characters, house: house);
  }

  List<CharecterEntity> _sortCharacters(
      {required List<CharecterEntity> characters, required String? house}) {
    if (house == null || house == '') {
      return characters;
    } else {
      return characters.where((e) => e.hogwartsHouse == house).toList();
    }
  }
}
