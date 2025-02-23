import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:test_app/core/services/dio_settings.dart';
//import 'package:test_app/modules/home/domain/repository/character_repository.dart';
import 'package:test_app/modules/home/presentation/bloc/fetch_all_characters_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FetchAllCharactersBloc, AppState>(
                builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SuccessState) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading:
                                Image.network(state.characters[index].image),
                            title: Text(state.characters[index].fullName),
                            subtitle: Text(
                              state.characters[index].nickName,
                            ));
                      }),
                );
              }
              return Center(child: Text('Nodata'));
            }),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<FetchAllCharactersBloc>()
                      .add(FetchAllCharactersEvent());
                },
                child: Text('Fetch Characters')),
          ],
        ),
      ),
    );
  }
}
