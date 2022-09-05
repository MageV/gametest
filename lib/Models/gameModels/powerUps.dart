import 'package:json_annotation/json_annotation.dart';

part 'powerUps.g.dart';

@JsonSerializable()
class powerUps {
  late final String name;
  late final double gain;
  late final int cost;
  late final String path;
  powerUps(this.name, this.gain, this.cost,this.path);
  factory powerUps.fromJson(Map<String,dynamic> json)=>_$powerUpsFromJson(json);
  Map<String,dynamic> toJson()=>_$powerUpsToJson(this);
}
