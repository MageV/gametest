// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'powerUps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

powerUps _$powerUpsFromJson(Map<String, dynamic> json) => powerUps(
      json['name'] as String,
      (json['gain'] as num).toDouble(),
      json['cost'] as int,
      json['path'] as String,
    );

Map<String, dynamic> _$powerUpsToJson(powerUps instance) => <String, dynamic>{
      'name': instance.name,
      'gain': instance.gain,
      'cost': instance.cost,
      'path': instance.path,
    };
