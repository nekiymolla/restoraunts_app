import 'package:json_annotation/json_annotation.dart';

part 'user_responce.g.dart';

@JsonSerializable()
class UserResponce {
  UserResponce(this.firstName, this.lastName, this.dateBorn, this.email,
      this.phoneNumber);
  @JsonKey(name: "firstName")
  final String firstName;
  @JsonKey(name: "lastName")
  final String lastName;
  @JsonKey(name: "dateBorn")
  final String dateBorn;
  @JsonKey(name: "phoneNumber")
  final String phoneNumber;
  @JsonKey(name: "email")
  final String email;
  factory UserResponce.fromJson(Map<String, dynamic> json) =>
      _$UserResponceFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponceToJson(this);
}
