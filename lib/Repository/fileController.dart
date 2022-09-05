import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gametest/Models/enums/fileControllerEntries.dart';
import 'package:gametest/Models/gameModels/GameEntity.dart';
import 'package:gametest/Models/gameModels/enemyEntity.dart';
import 'package:gametest/Models/gameModels/powerUps.dart';
import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Repository/powerUpsController.dart';
import 'package:gametest/Tools/Encoders.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';
import 'package:get_it/get_it.dart';

import '../Models/toolModels/confStrings.dart';
import 'entityController.dart';

class fileController implements baseController {
  static String BusName = "FileController";
  @override
  late MessageQueueBus messageBus;
  late List<confStrings> _configs;

  fileController() {
    messageBus = GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event) => DecodeMessage(event));
    _loadJsonFromConfig();
  }

  @override
  void DecodeMessage(Message msg) {
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
      Message msg=Message(fileController.BusName,EntityController.BusName, data, false);
      post(msg);
    }

  }

  void _preloadSounds(Iterable raw) {}
  void _preloadPowerups(Iterable raw) {
    List<powerUps> powerups=List<powerUps>.from(raw.map((data) => powerUps.fromJson(data)));
    for (var element in powerups) {
      dynamic data=((element)as powerUps).toJson();
      Message msg=Message(fileController.BusName,powerUpsController.BusName, data, false);
      post(msg);
    }
  }

  void _loadSprite(String type, String path) {
    switch (type) {
      case "entities":
        {
          Image img=Image.asset(path);
          Map<String,dynamic> data=
              {
                'action':fileControllerEmissive.FCE_sprite,
                'image':img
              };
          Message msg=Message(fileController.BusName, EntityController.BusName, Encoders.toJsonEncoder(data), false);
          post(msg);
          break;
        }
      case "powerups":
        {
          Image img=Image.asset(path);
          Map<String,dynamic> data=
          {
            'action':fileControllerEmissive.FCE_sprite,
            'image':img
          };
          Message msg=Message(fileController.BusName, powerUpsController.BusName, Encoders.toJsonEncoder(data), false);
          post(msg);
          break;
        }
    }
  }

  @override
  void AddItem(String name) {
    // TODO: implement AddItem
  }

  @override
  void ChangeState(bool state, String key) {
    // TODO: implement ChangeState
  }
}
