import 'package:gametest/Models/enums/ResourceTypeEnum.dart';
import 'package:gametest/Models/enums/messageEntityEnum.dart';
import 'package:gametest/Models/enums/fileControllerEnum.dart';
import 'package:gametest/Models/gameModels/GameEntity.dart';
import 'package:gametest/Models/gameModels/enemyEntity.dart';
import 'package:gametest/Models/gameModels/playerEntity.dart';
import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Repository/ViewController.dart';
import 'package:gametest/Repository/fileController.dart';
import 'package:gametest/Repository/powerUpsController.dart';
import 'package:gametest/Tools/Encoders.dart';
import 'package:get_it/get_it.dart';

import '../Tools/MessageQueueBus.dart';

class EntityController implements baseController
{
  late final Map<String,gameEntity> _entities;
  static const String BusName="EntityController";
  @override
  late MessageQueueBus messageBus;
  late PlayerEntity player;
  EntityController()
  {
    _entities={};
    messageBus=GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event)=>DecodeMessage(event));
  }
  @override
  void DecodeMessage(Message msg) {
    if(msg.to==EntityController.BusName) {
      if(msg.from==FileController.BusName)
        {
          dynamic data=Encoders.fromJsonDecoder(msg.data);
          if(data['action']==null)
            {
              enemyEntity enemy=enemyEntity.fromJson(msg.data);
              _addEntity(enemy);
            }
          else if(data['action']==fileControllerEnum.FCE_sprite)
          {

          }
        }
    }
    else if(msg.to=="*")
    {

    }
    // TODO: implement DecodeMessage
  }

  @override
  void post(Message msg) {
    messageBus.push(msg);
  }
  void _addEntity(gameEntity entity)
  {
    gameEntity local=entity;
    local.changeState(false);
    _entities.putIfAbsent(local.nameEntity, () => local);
    Map<String,dynamic> data=
        {
          'entity':local.nameEntity,
          'action':messageEntityEnum.messageEntity_Add
        };
    Message msg=Message(EntityController.BusName,ViewController.BusName, Encoders.toJsonEncoder(data),false);
    post(msg);
  }

  void _Remove(String name)
  {
    _entities.remove(_entities[name]);
    Map<String,dynamic> data=
    {
      'entity':name,
      'action':messageEntityEnum.messageEntity_Remove
    };
    Message msg=Message(EntityController.BusName,ViewController.BusName , Encoders.toJsonEncoder(data),false);
    post(msg);
  }
  void _attack(String from,String to)
  {
    int get_damage=_entities[from]!.makeDamage();
    _entities[to]?.haveDamage(get_damage);
    Map<String,dynamic> data=
    {
      'entity':to,
      'action':messageEntityEnum.messageEntity_Hit
    };
    Message msg=Message(EntityController.BusName, ViewController.BusName, Encoders.toJsonEncoder(data), false);
    post(msg);
    if(_entities[to]?.entityHealth==0) _Remove(to);
  }
  @override
  void ChangeState(bool state,String key)
  {
    _entities[key]?.changeState(state);
  }


  void AssignModifier(String name,String to) {
  }
}