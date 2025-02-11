import 'package:flutter/foundation.dart';

class PictureModel {
  final String message;
  final String status;

  PictureModel({required this.message, required this.status});

  factory PictureModel.fromMap(Map<String, dynamic> map) {
    return PictureModel(
      message: map['message'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
