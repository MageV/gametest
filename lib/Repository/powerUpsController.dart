import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Repository/fileController.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';
import 'package:get_it/get_it.dart';

import '../Models/gameModels/powerUps.dart';

class powerUpsController implements baseController
{
  @override
  late MessageQueueBus messageBus;
  static final String BusName="powerUpsController";
  late final Map<String,powerUps> powerUpsList;

  powerUpsController()
  {
    messageBus=GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event)=>DecodeMessage(event));
    powerUpsList={};
  }

  @override
  void DecodeMessage(Message msg) {
    if(msg.to==powerUpsController.BusName)
      {
        if(msg.from==fileController.BusName)
          {

          }
      }
  }

  @override
  void post(Message msg) {
    messageBus.push(msg);
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