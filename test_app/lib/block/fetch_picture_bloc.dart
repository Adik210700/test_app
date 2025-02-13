import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/model/picture_model.dart';

class FetchPictureBloc extends Bloc<FetchPictureEvent, FetchPictureState> {
  FetchPictureBloc() : super(InitPictureState()) {
    on<FetchDogImageEvent>((event, emit) async {
      emit(LaodingPictureState());
      final response =
          await Dio().get('https://dog.ceo/api/breeds/image/random');
      final model = PictureModel.fromMap(response.data);
      emit(SuccessPictureState(model: model));
    });
    on<DeleteDogImage>((event, emit) {
      log('DeleteDogImage');
    });
  }
}

abstract class FetchPictureEvent {}

class FetchDogImageEvent extends FetchPictureEvent {}

class DeleteDogImage extends FetchPictureEvent {}

abstract class FetchPictureState {
  get model => null;
}

class InitPictureState extends FetchPictureState {}

class LaodingPictureState extends FetchPictureState {}

class SuccessPictureState extends FetchPictureState {
  final PictureModel model;

  SuccessPictureState({required this.model});
}

class ErrorpictureState extends FetchPictureState {}
