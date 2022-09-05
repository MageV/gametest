import 'package:gametest/Models/gameModels/GameEntity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enemyEntity.g.dart';

@JsonSerializable()
class enemyEntity implements gameEntity
{
  @override
  late int entityHealth;

  @override
  late String nameEntity;

  @override
  late String spritePath;

  @override
  int hitPower;
  @override
  bool isActive;


  enemyEntity(this.nameEntity,this.entityHealth,this.spritePath,this.hitPower,this.isActive)
  :super();

  factory enemyEntity.fromJson(Map<String,dynamic> json)=>_$enemyEntityFromJson(json);
  Map<String,dynamic> toJson()=>_$enemyEntityToJson(this);


  @override
  void haveDamage(int power) {
    entityHealth=entityHealth-power<=0?0:entityHealth-power;
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