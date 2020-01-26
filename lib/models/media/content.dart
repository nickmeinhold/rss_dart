library content;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:xml/xml.dart';

part 'content.g.dart';

abstract class Content implements Built<Content, ContentBuilder> {
  @nullable
  String get url;
  @nullable
  String get type;
  @nullable
  int get fileSize;
  @nullable
  String get medium;
  @nullable
  bool get isDefault;
  @nullable
  String get expression;
  @nullable
  int get bitrate;
  @nullable
  double get framerate;
  @nullable
  double get samplingrate;
  @nullable
  int get channels;
  @nullable
  int get duration;
  @nullable
  int get height;
  @nullable
  int get width;
  @nullable
  String get lang;

  Content._();

  factory Content([void Function(ContentBuilder) updates]) = _$Content;

  factory Content.parse(XmlElement element) {
    if (element == null) {
      return null;
    }

    final builder = ContentBuilder();
    builder
      ..url = element.getAttribute('url')
      ..type = element.getAttribute('type')
      ..fileSize = int.tryParse(element.getAttribute('fileSize') ?? '0')
      ..medium = element.getAttribute('medium')
      ..isDefault = element.getAttribute('isDefault') == 'true'
      ..expression = element.getAttribute('expression')
      ..bitrate = int.tryParse(element.getAttribute('bitrate') ?? '0')
      ..framerate = double.tryParse(element.getAttribute('framerate') ?? '0')
      ..samplingrate = double.tryParse(
        element.getAttribute('samplingrate') ?? '0',
      )
      ..channels = int.tryParse(element.getAttribute('channels') ?? '0')
      ..duration = int.tryParse(element.getAttribute('duration') ?? '0')
      ..height = int.tryParse(element.getAttribute('height') ?? '0')
      ..width = int.tryParse(element.getAttribute('width') ?? '0')
      ..lang = element.getAttribute('lang');

    return builder.build();
    // return new Content(
    //   url: element.getAttribute('url'),
    //   type: element.getAttribute('type'),
    //   fileSize: int.tryParse(element.getAttribute('fileSize') ?? '0'),
    //   medium: element.getAttribute('medium'),
    //   isDefault: element.getAttribute('isDefault') == 'true',
    //   expression: element.getAttribute('expression'),
    //   bitrate: int.tryParse(element.getAttribute('bitrate') ?? '0'),
    //   framerate: double.tryParse(element.getAttribute('framerate') ?? '0'),
    //   samplingrate: double.tryParse(
    //     element.getAttribute('samplingrate') ?? '0',
    //   ),
    //   channels: int.tryParse(element.getAttribute('channels') ?? '0'),
    //   duration: int.tryParse(element.getAttribute('duration') ?? '0'),
    //   height: int.tryParse(element.getAttribute('height') ?? '0'),
    //   width: int.tryParse(element.getAttribute('width') ?? '0'),
    //   lang: element.getAttribute('lang'),
    // );
  }

  Object toJson() => serializers.serializeWith(Content.serializer, this);

  static Content fromJson(String jsonString) =>
      serializers.deserializeWith(Content.serializer, json.decode(jsonString));

  static Serializer<Content> get serializer => _$contentSerializer;
}
