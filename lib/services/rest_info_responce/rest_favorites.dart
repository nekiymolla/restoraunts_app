import 'package:json_annotation/json_annotation.dart';
part 'rest_favorites.g.dart';

@JsonSerializable()
class RestFavorites {
  RestFavorites(this.id, this.accountId);
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "accountId")
  final int accountId;
  factory RestFavorites.fromJson(Map<String, dynamic> json) =>
      _$RestFavoritesFromJson(json);
  Map<String, dynamic> toJson() => _$RestFavoritesToJson(this);
}
