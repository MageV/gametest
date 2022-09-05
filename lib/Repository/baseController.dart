

import '../Models/toolModels/Message.dart';
import '../Tools/MessageQueueBus.dart';

abstract class baseController
{
  late MessageQueueBus messageBus;
  void DecodeMessage(Message msg);
  void post(Message msg);
}