import 'package:json_annotation/json_annotation.dart';

part 'confStrings.g.dart';

@JsonSerializable()
class confStrings
{
  late final String name;
  late final String file;
  confStrings(this.name,this.file);
  factory confStrings.fromJson(Map<String,dynamic> json)=>_$confStringsFromJson(json);
  Map<String,dynamic> toJson()=>_$confStringsToJson(this);
}