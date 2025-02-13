import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/block/fetch_picture_bloc.dart';
import 'package:test_app/home_screen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchPictureBloc(),
      child: MaterialApp(
        home: StreamBuilderExample(
          delay: Duration(seconds: 1),
        ),
      ),
    );
  }
}
