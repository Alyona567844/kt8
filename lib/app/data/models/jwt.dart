import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt.freezed.dart';
part 'jwt.g.dart';

@freezed
class JWTModel with _$JWTModel {

  factory JWTModel(
    String? accessToken,
    String refreshToken,
  ) = _JWTModel;

  factory JWTModel.fromJson(Map<String, dynamic> json) => _$JWTModelFromJson(json);
}