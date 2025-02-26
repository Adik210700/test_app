import 'package:bloc/bloc.dart';
import 'package:test_app/core/enum/hogearts_house.dart';
import 'package:test_app/modules/home/domain/entity/charecter_entity.dart';
import 'package:test_app/modules/home/domain/usecase/fetch_all_characters_usecase.dart';

class FetchAllCharactersBloc extends Bloc<AppEvent, AppState> {
  final FetchAllCharactersUsecase usecase;

  FetchAllCharactersBloc({required this.usecase})
      : super(
          InitState(),
        ) {
    on<FetchAllCharactersEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final result = await usecase.execute(event.house.houseName);

        emit(SuccessState(characters: result));
      } catch (e) {
        emit(ErrorState());
      }
    });
  }
}

abstract class AppEvent {}

class FetchAllCharactersEvent extends AppEvent {
  FetchAllCharactersEvent({required this.house});

  final HogeartsHouse house;
}

abstract class AppState {}

class InitState extends AppState {}

class LoadingState extends AppState {}

class SuccessState extends AppState {
  final List<CharecterEntity> characters;

  SuccessState({required this.characters});
}

class ErrorState extends AppState {}
