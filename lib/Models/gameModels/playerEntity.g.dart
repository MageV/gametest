// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerEntity _$playerEntityFromJson(Map<String, dynamic> json) => PlayerEntity(
      json['entityHealth'] as int,
      json['nameEntity'] as String,
      json['spritePath'] as String,
      json['hitPower'] as int,
      json['isActive'] as bool,
    )..modifier = powerUps.fromJson(json['modifier'] as Map<String, dynamic>);

Map<String, dynamic> _$playerEntityToJson(PlayerEntity instance) =>
    <String, dynamic>{
      'entityHealth': instance.entityHealth,
      'nameEntity': instance.nameEntity,
      'spritePath': instance.spritePath,
      'hitPower': instance.hitPower,
      'isActive': instance.isActive,
      'modifier': instance.modifier,
    };
