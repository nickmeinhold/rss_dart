library group;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/media/content.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:xml/xml.dart';

part 'group.g.dart';

abstract class Group implements Built<Group, GroupBuilder> {
  BuiltList<Content> get contents;
  // final List<Credit> credits;
  // final Category category;
  // final Rating rating;

  Group._();

  factory Group([void Function(GroupBuilder) updates]) = _$Group;

  factory Group.parse(XmlElement element) {
    if (element == null) {
      return null;
    }

    final builder = GroupBuilder();
    builder
      ..contents.addAll(element.findElements('media:content').map(
            (e) => Content.parse(e),
          ));
    return builder.build();

    // if (element == null) {
    //   return null;
    // }
    // return new Group(
    //   contents: element.findElements('media:content').map((e) {
    //     return new Content.parse(e);
    //   }).toList(),
    //   credits: element.findElements('media:credit').map((e) {
    //     return new Credit.parse(e);
    //   }).toList(),
    //   category: new Category.parse(
    //     findElementOrNull(element, 'media:category'),
    //   ),
    //   rating: new Rating.parse(
    //     findElementOrNull(element, 'media:rating'),
    //   ),
    // );
  }

  Object toJson() => serializers.serializeWith(Group.serializer, this);

  static Group fromJson(String jsonString) =>
      serializers.deserializeWith(Group.serializer, json.decode(jsonString));

  static Serializer<Group> get serializer => _$groupSerializer;
}
