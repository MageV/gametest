import 'package:gametest/Models/toolModels/Message.dart';
import 'package:gametest/Repository/baseController.dart';
import 'package:gametest/Tools/MessageQueueBus.dart';

class ViewController implements baseController
{
  @override late MessageQueueBus messageBus;

static const String BusName="ViewController";
  @override
  void DecodeMessage(Message msg) {
    // TODO: implement DecodeMessage
  }

  @override
  void post(Message msg) {
    // TODO: implement post
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