// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponce _$UserResponceFromJson(Map<String, dynamic> json) => UserResponce(
      json['firstName'] as String,
      json['lastName'] as String,
      json['dateBorn'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UserResponceToJson(UserResponce instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateBorn': instance.dateBorn,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
