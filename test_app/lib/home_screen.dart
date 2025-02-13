import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/block/fetch_picture_bloc.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({required this.delay, super.key});

  final Duration delay;

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          BlocBuilder<FetchPictureBloc, FetchPictureState>(
              builder: (context, state) {
            if (state is LaodingPictureState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SuccessPictureState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<FetchPictureBloc>()
                            .add(FetchDogImageEvent());
                        log(state.toString());
                      },
                      child: Text('fetch image')),
                  Center(child: Image.network(state.model.message)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<FetchPictureBloc>()
                            .add(FetchDogImageEvent());
                        log(state.toString());
                      },
                      child: Text('fetch image')),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Text(
                    'no data',
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
