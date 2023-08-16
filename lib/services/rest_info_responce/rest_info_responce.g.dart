// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_info_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestInfoResponce _$RestInfoResponceFromJson(Map<String, dynamic> json) =>
    RestInfoResponce(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['address'] as String,
      json['timeOpening'] as String,
      json['timeClosed'] as String,
      json['ownerId'] as int,
      (json['favorites'] as List<dynamic>)
          .map((e) => RestFavorites.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestInfoResponceToJson(RestInfoResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'timeOpening': instance.timeOpening,
      'timeClosed': instance.timeClosed,
      'ownerId': instance.ownerId,
      'favorites': instance.favorites,
    };
