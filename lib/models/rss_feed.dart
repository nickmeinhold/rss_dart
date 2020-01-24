library rss_feed;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/rss_item.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:rss_dart/utils/extensions.dart';
import 'package:xml/xml.dart';

part 'rss_feed.g.dart';

abstract class RssFeed implements Built<RssFeed, RssFeedBuilder> {
  String get title;
  @nullable
  String get author;
  String get description;
  String get link;
  BuiltList<RssItem> get items;

  // RssImage get image;
  // RssCloud get cloud;
  // BuiltList<RssCategory> get categories;
  // BuiltList<String> get skipDays;
  // BuiltList<int> get skipHours;
  // String get lastBuildDate;
  // String get language;
  // String get generator;
  // String get copyright;
  // String get docs;
  // String get managingEditor;
  // String get rating;
  // String get webMaster;
  // int get ttl;
  // DublinCore get dc;
  // RssItunes get itunes;

  RssFeed._();

  factory RssFeed([void Function(RssFeedBuilder) updates]) = _$RssFeed;

  factory RssFeed.parse(String xmlString) {
    var document = parse(xmlString);
    XmlElement channelElement;
    try {
      channelElement = document.findAllElements('channel').first;
    } on StateError {
      throw ArgumentError('channel not found');
    }

    final itemsBuilder = ListBuilder<RssItem>();
    itemsBuilder.addAll(channelElement
        .findElements('item')
        .map<RssItem>((element) => RssItem.parse(element)));

    final feedBuilder = RssFeedBuilder()
      ..title = channelElement.select('title')
      ..author = channelElement.select('author')
      ..description = channelElement.select('description')
      ..link = channelElement.select('link')
      ..items = itemsBuilder;

    return feedBuilder.build();
  }

  // image: RssImage.parse(findElementOrNull(channelElement, 'image')),
  // cloud: RssCloud.parse(findElementOrNull(channelElement, 'cloud')),
  // categories: channelElement.findElements('category').map((element) {
  //   return RssCategory.parse(element);
  // }).toList(),
  // skipDays: findElementOrNull(channelElement, 'skipDays')
  //         ?.findAllElements('day')
  //         ?.map((element) {
  //       return element.text;
  //     })?.toList() ??
  //     [],
  // skipHours: findElementOrNull(channelElement, 'skipHours')
  //         ?.findAllElements('hour')
  //         ?.map((element) {
  //       return int.tryParse(element.text ?? '0');
  //     })?.toList() ??
  //     [],
  // lastBuildDate: findElementOrNull(channelElement, 'lastBuildDate')?.text,
  // language: findElementOrNull(channelElement, 'language')?.text,
  // generator: findElementOrNull(channelElement, 'generator')?.text,
  // copyright: findElementOrNull(channelElement, 'copyright')?.text,
  // docs: findElementOrNull(channelElement, 'docs')?.text,
  // managingEditor: findElementOrNull(channelElement, 'managingEditor')?.text,
  // rating: findElementOrNull(channelElement, 'rating')?.text,
  // webMaster: findElementOrNull(channelElement, 'webMaster')?.text,
  // ttl: int.tryParse(findElementOrNull(channelElement, 'ttl')?.text ?? '0'),
  // dc: DublinCore.parse(channelElement),
  // itunes: RssItunes.parse(channelElement),
  // );

  Object toJson() => serializers.serializeWith(RssFeed.serializer, this);

  static RssFeed fromJson(String jsonString) =>
      serializers.deserializeWith(RssFeed.serializer, json.decode(jsonString));

  static Serializer<RssFeed> get serializer => _$rssFeedSerializer;
}
