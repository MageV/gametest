import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Repository/fileController.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';
import 'package:get_it/get_it.dart';
import 'package:gametest/Models/enums/fileControllerEntries.dart';

import '../Models/gameModels/powerUps.dart';
import '../Tools/Encoders.dart';

class PowerUpsController implements baseController
{
  @override
  late MessageQueueBus messageBus;
  static const String BusName="powerUpsController";
  late final Map<String,powerUps> _powerUpsList;

  PowerUpsController()
  {
    messageBus=GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event)=>DecodeMessage(event));
    _powerUpsList={};
  }

  @override
  void DecodeMessage(Message msg) {
    if(msg.to==PowerUpsController.BusName)
      {
        if(msg.from==FileController.BusName)
          {
            dynamic data=Encoders.fromJsonDecoder(msg.data);
            if(data['action']==null)
            {
              powerUps extender=powerUps.fromJson(msg.data);
              _AddItem(extender);
            }
            else if(data['action']==fileControllerEmissive.FCE_sprite)
            {

            }

          }
      }
  }

  @override
  void post(Message msg) {
    messageBus.push(msg);
  }

  @override
  void _AddItem(powerUps name) {
    _powerUpsList.putIfAbsent(name.name, () => name);
  }

  @override
  void ChangeState(bool state, String key) {
    // TODO: implement ChangeState
  }


}