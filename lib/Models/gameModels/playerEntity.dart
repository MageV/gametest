import 'package:gametest/Models/gameModels/GameEntity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'powerUps.dart';
part 'playerEntity.g.dart';

@JsonSerializable()
class PlayerEntity implements gameEntity{
  @override
  late int entityHealth;

  @override
  late String nameEntity;

  @override
  late String spritePath;

  @override
  late int hitPower;

  @override
  late bool isActive;

  late final powerUps modifier;


  PlayerEntity(
      this.entityHealth, this.nameEntity, this.spritePath, this.hitPower,this.isActive):super();


  factory PlayerEntity.fromJson(Map<String,dynamic> json)=>_$playerEntityFromJson(json);
  Map<String,dynamic> toJson()=>_$playerEntityToJson(this);

  @override
  void haveDamage(int power) {
    entityHealth=entityHealth-(power*modifier.gain).round()<=0?0:entityHealth-power;
  }

  @override
  int makeDamage() {
    return hitPower;
  }

  @override
  void changeState(bool state)
  {
    isActive=state;
  }



}