library rss_enclosure;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:xml/xml.dart';

part 'rss_enclosure.g.dart';

abstract class RssEnclosure
    implements Built<RssEnclosure, RssEnclosureBuilder> {
  @nullable
  String get url;
  @nullable
  String get type;
  @nullable
  int get length;

  RssEnclosure._();

  factory RssEnclosure([void Function(RssEnclosureBuilder) updates]) =
      _$RssEnclosure;

  factory RssEnclosure.parse(XmlElement element) {
    if (element == null) {
      return null;
    }

    final builder = RssEnclosureBuilder()
      ..url = element.getAttribute('url')
      ..type = element.getAttribute('type')
      ..length = int.tryParse(element.getAttribute('length') ?? '0');

    return builder.build();
  }

  Object toJson() => serializers.serializeWith(RssEnclosure.serializer, this);

  static RssEnclosure fromJson(String jsonString) => serializers
      .deserializeWith(RssEnclosure.serializer, json.decode(jsonString));

  static Serializer<RssEnclosure> get serializer => _$rssEnclosureSerializer;
}
