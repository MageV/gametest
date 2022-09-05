import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';
import 'package:get_it/get_it.dart';

class powerUpsController implements baseController
{
  @override
  late MessageQueueBus messageBus;
  static final String BusName="powerUpsController";

  powerUpsController()
  {
    messageBus=GetIt.instance.get(instanceName: MessageQueueBus.BusName);
    messageBus.messages.stream.listen((event)=>DecodeMessage(event));
  }

  @override
  void DecodeMessage(Message msg) {
    // TODO: implement DecodeMessage
  }

  @override
  void post(Message msg) {
    messageBus.push(msg);
  }

}