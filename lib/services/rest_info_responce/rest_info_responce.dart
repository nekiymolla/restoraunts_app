import 'package:json_annotation/json_annotation.dart';
import 'package:restaraunts/services/rest_info_responce/rest_favorites.dart';
part 'rest_info_responce.g.dart';

@JsonSerializable()
class RestInfoResponce {
  RestInfoResponce(this.id, this.name, this.description, this.address,
      this.timeOpening, this.timeClosed, this.ownerId, this.favorites);
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "timeOpening")
  final String timeOpening;
  @JsonKey(name: "timeClosed")
  final String timeClosed;
  @JsonKey(name: "ownerId")
  final int ownerId;
  @JsonKey(name: "favorites")
  final List<RestFavorites> favorites;
  factory RestInfoResponce.fromJson(Map<String, dynamic> json) =>
      _$RestInfoResponceFromJson(json);
  Map<String, dynamic> toJson() => _$RestInfoResponceToJson(this);
}
