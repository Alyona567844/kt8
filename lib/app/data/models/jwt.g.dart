// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JWTModelImpl _$$JWTModelImplFromJson(Map<String, dynamic> json) =>
    _$JWTModelImpl(
      json['accessToken'] as String?,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$$JWTModelImplToJson(_$JWTModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
