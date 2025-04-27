import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class Users {
  @JsonKey(name: "userId")
  final int? userId;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "body")
  final String? body;

  Users({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
