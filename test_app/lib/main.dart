import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/services/dio_settings.dart';
import 'package:test_app/modules/home/domain/repository/character_repository.dart';
import 'package:test_app/modules/home/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:test_app/modules/home/presentation/bloc/fetch_all_characters_bloc.dart';
import 'package:test_app/modules/home/presentation/home_screen.dart';
import 'package:test_app/modules/home/presentation/provider/home_bg_provider.dart';
import 'package:test_app/modules/profile/presentation/provider/user_provider.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAllCharactersBloc(
            usecase: FetchAllCharactersUsecase(
              repository: CharacterRepository(dio: DioSettings().dio),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (create) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeBgProvider(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
