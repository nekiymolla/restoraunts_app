// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaraunts/services/favorites_responce/favorites_data_view_model.dart';
import 'package:restaraunts/services/tokens.dart';

class FavoritesRepository {
  final Dio _dio;
  static const String _url =
      'http://188.225.44.128:3000/restaurants/favorites/get';
  FavoritesRepository() : _dio = SessionManager.api;
  Future<Either<String, List<FavoritesDataViewModel>>> getAllFavorites() async {
    try {
      final response = await _dio.get(_url);
      print('work');
      final favoritesData = (response.data as List)
          .map((final element) => FavoritesDataViewModel.fromJson(element))
          .toList();
      return Right(favoritesData);
    } catch (dioError) {
      return Left(dioError.toString());
    }
  }
}
