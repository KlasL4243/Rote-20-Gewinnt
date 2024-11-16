import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/json_map.dart';

typedef RoundData = LinkedHashMap<String, int>;

class RoundDataConvertor extends JsonConverter<RoundData, JsonMap> {
  const RoundDataConvertor();

  @override
  RoundData fromJson(JsonMap json) => RoundData.from(json);

  @override
  JsonMap toJson(RoundData object) => Map.from(object);
}
