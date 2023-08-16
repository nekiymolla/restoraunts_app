// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaraunts/services/restaraunts_responce/restoraunts_data_view_model.dart';
import 'package:restaraunts/services/tokens.dart';

class RestorauntsRepository {
  final Dio _dio;
  static const String _url = 'http://188.225.44.128:3000/restaurants/get';
  RestorauntsRepository() : _dio = SessionManager.api;
  Future<Either<String, List<RestorauntsDataViewModel>>>
      getAllRestoraunts() async {
    try {
      final response = await _dio.get(_url);
      print('work');
      final actionsData = (response.data as List)
          .map((final element) => RestorauntsDataViewModel.fromJson(element))
          .toList();
      return Right(actionsData);
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }
}
