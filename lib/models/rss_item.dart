library rss_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:xml/xml.dart';
import 'package:rss_dart/utils/extensions.dart';

part 'rss_item.g.dart';

abstract class RssItem implements Built<RssItem, RssItemBuilder> {
  String get title;
  String get description;
  String get link;

  // List<RssCategory> get categories;
  // String get guid;
  // String get pubDate;
  // String get author;
  // String get comments;
  // RssSource get source;
  // RssContent get content;
  // Media get media;
  // RssEnclosure get enclosure;
  // DublinCore get dc;
  // RssItemItunes get itunes;

  RssItem._();

  factory RssItem([void Function(RssItemBuilder) updates]) = _$RssItem;

  factory RssItem.parse(XmlElement element) {
    final builder = RssItemBuilder()
      ..title = element.select('title')
      ..description = element.select('description')
      ..link = element.select('link');

    return builder.build();
  }

  // return RssItem(

  // categories: element.findElements("category").map((element) {
  //   return RssCategory.parse(element);
  // }).toList(),
  // guid: findElementOrNull(element, "guid")?.text,
  // pubDate: findElementOrNull(element, "pubDate")?.text,
  // author: findElementOrNull(element, "author")?.text,
  // comments: findElementOrNull(element, "comments")?.text,
  // source: RssSource.parse(findElementOrNull(element, "source")),
  // content: RssContent.parse(findElementOrNull(element, "content:encoded")),
  // media: Media.parse(element),
  // enclosure: RssEnclosure.parse(findElementOrNull(element, "enclosure")),
  // dc: DublinCore.parse(element),
  // itunes: RssItemItunes.parse(element),
  // );
  // }

  Object toJson() => serializers.serializeWith(RssItem.serializer, this);

  static RssItem fromJson(String jsonString) =>
      serializers.deserializeWith(RssItem.serializer, json.decode(jsonString));

  static Serializer<RssItem> get serializer => _$rssItemSerializer;
}
