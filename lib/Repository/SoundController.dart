import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';

class SoundController implements baseController
{
  static const String BusName="SoundController";
  @override
  late final MessageQueueBus messageBus;

  @override
  void ChangeState(bool state, String key) {
    // TODO: implement ChangeState
  }

  @override
  void DecodeMessage(Message msg) {
    // TODO: implement DecodeMessage
  }

  @override
  void post(Message msg) {
    // TODO: implement post
  }

  @override
  void AssignModifier(String name,String to) {
    //not implemented here - stub
  }

}