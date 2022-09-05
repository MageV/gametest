import 'dart:convert';

class Encoders
{
  static Map fromJsonDecoder(dynamic json)
  {
    JsonDecoder decoder=const JsonDecoder();
    return decoder.convert(json);
  }
  static String toJsonEncoder(Map data)
  {
    JsonEncoder encoder=const JsonEncoder();
    return encoder.convert(data);
  }
  static Iterable fromJsonRaw(dynamic input)
  {
    return json.decode(input);
  }


}
