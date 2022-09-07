import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gametest/Models/enums/fileControllerEnum.dart';
import 'package:gametest/Models/gameModels/GameEntity.dart';
import 'package:gametest/Models/gameModels/enemyEntity.dart';
import 'package:gametest/Models/gameModels/powerUps.dart';
import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/SoundController.dart';
import 'package:gametest/Repository/ViewController.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Repository/powerUpsController.dart';
import 'package:gametest/Tools/Encoders.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';
import 'package:get_it/get_it.dart';

import '../Models/enums/ResourceTypeEnum.dart';
import '../Models/toolModels/confStrings.dart';
import 'entityController.dart';

class FileController implements baseController {
  static const String BusName = "FileController";
  @override
  late MessageQueueBus messageBus;
  late List<confStrings> _configs;

  FileController() {
    messageBus = GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event) => DecodeMessage(event));
    _loadJsonFromConfig();
  }

  @override
  void DecodeMessage(Message msg) {
    if(msg.to==FileController.BusName)
      {
       switch(msg.from)
       {
         case EntityController.BusName:
           {
             break;
           }
         case PowerUpsController.BusName:
           {
             break;
           }
         case ViewController.BusName:
           {
             break;
           }
         case SoundController.BusName:
           {
             break;
           }
       }
      }
    // TODO: implement DecodeMessage
  }

  @override
  void post(Message msg) {
    messageBus.push(msg);
  }

  void _loadJsonFromConfig() async {
    String _jsonConfig =
        await rootBundle.loadString('assets/config/config.json');
    Iterable decoded = Encoders.fromJsonRaw(_jsonConfig);
    _configs = List<confStrings>.from(
        decoded.map((data) => confStrings.fromJson(data)));
    for (var element in _configs)  {
      String data = await rootBundle.loadString(element.file);
      Iterable decoded = Encoders.fromJsonRaw(data);
      switch (element.name) {
        case "entities":
          {
            _preloadEntities(decoded);
            break;
          }
        case "powerups":
          {
            _preloadPowerups(decoded);
            break;
          }
        case "sounds":
          {
            _preloadSounds(decoded);
            break;
          }
      }
    }
  }

  void _preloadEntities(Iterable raw) {
    List<gameEntity> entities =
        List<enemyEntity>.from(raw.map((data) => enemyEntity.fromJson(data)));
    for (var element in entities) {
      dynamic data=((element)as enemyEntity).toJson();
      Message msg=Message(FileController.BusName,EntityController.BusName, data, false);
      post(msg);
    }

  }

  void _preloadSounds(Iterable raw) {}
  void _preloadPowerups(Iterable raw) {
    List<powerUps> powerups=List<powerUps>.from(raw.map((data) => powerUps.fromJson(data)));
    for (var element in powerups) {
      dynamic data=((element)as powerUps).toJson();
      Message msg=Message(FileController.BusName,PowerUpsController.BusName, data, false);
      post(msg);
    }
  }

  void _loadSprite(ResourceTypeEnum rctype, String path) {
          Image img=Image.asset(path);
          Map<String,dynamic> data=
              {
                'action':fileControllerEnum.FCE_sprite,
                'image':img,
                'type':rctype
              };
          Message msg=Message(FileController.BusName, ViewController.BusName, Encoders.toJsonEncoder(data), false);
          post(msg);
  }

  @override
  void ChangeState(bool state, String key) {
    //not implemented here - stub
  }


}
