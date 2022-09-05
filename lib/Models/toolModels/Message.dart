import 'package:flutter/material.dart';
import 'package:shortid/shortid.dart';

class Message
{
  final id=shortid.generate();
  final String from;
  final String to;
  final bool requiredResponse;
  var data;
  Message(
      @required this.from,
      @required this.to,
      @required this.data,
      @required this.requiredResponse
      );
}