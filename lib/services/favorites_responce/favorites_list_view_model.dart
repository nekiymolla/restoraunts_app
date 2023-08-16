import 'package:restaraunts/services/favorites_responce/favorites_data_view_model.dart';

class FavoritesListViewModel {
  int? id;
  List<FavoritesDataViewModel>? favoritesData;
  FavoritesListViewModel({this.id, this.favoritesData});
  FavoritesListViewModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    favoritesData = (json["restaurant"] as List)
        .map((final element) => FavoritesDataViewModel.fromJson(element))
        .toList();
  }
}
