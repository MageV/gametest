import 'dart:async';
import 'dart:collection';
import 'package:gametest/Models/toolModels/Message.dart';
import 'package:rxdart/rxdart.dart';

 class MessageQueueBus
{
  static const BusName="MessageQueueBus";
  late final ReplaySubject messages;
  Future push(Message msg)
  async{
    messages.add(msg);
  }
  MessageQueueManager()
  {
    messages=ReplaySubject<Message>();
  }
  void destroy()
  {
    messages.close();
  }
}