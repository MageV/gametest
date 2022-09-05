// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enemyEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

enemyEntity _$enemyEntityFromJson(Map<String, dynamic> json) => enemyEntity(
      json['nameEntity'] as String,
      json['entityHealth'] as int,
      json['spritePath'] as String,
      json['hitPower'] as int,
      json['isActive'] as bool,
    );

Map<String, dynamic> _$enemyEntityToJson(enemyEntity instance) =>
    <String, dynamic>{
      'entityHealth': instance.entityHealth,
      'nameEntity': instance.nameEntity,
      'spritePath': instance.spritePath,
      'hitPower': instance.hitPower,
      'isActive': instance.isActive,
    };
