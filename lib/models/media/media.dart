library media;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/media/content.dart';
import 'package:rss_dart/models/serializers.dart';
import 'package:xml/xml.dart';

part 'media.g.dart';

abstract class Media implements Built<Media, MediaBuilder> {
  // Group group;
  BuiltList<Content> get contents;
  // List<Credit> credits;
  // Category category;
  // Rating rating;
  // Title title;
  // Description description;
  // String keywords;
  // List<Thumbnail> thumbnails;
  // Hash hash;
  // Player player;
  // Copyright copyright;
  // Text text;
  // Restriction restriction;
  // Community community;
  // List<String> comments;
  // Embed embed;
  // List<String> responses;
  // List<String> backLinks;
  // Status status;
  // List<Price> prices;
  // License license;
  // PeerLink peerLink;
  // Rights rights;
  // List<Scene> scenes;

  Media._();

  factory Media([void Function(MediaBuilder) updates]) = _$Media;

  factory Media.parse(XmlElement element) {
    if (element == null) {
      return null;
    }

    final builder = MediaBuilder();
    builder
      ..contents.addAll(
        element.findElements('media:content').map((e) {
          return Content.parse(e);
        }),
      );

    return builder.build();
  }
  // return Media(
  //   group: Group.parse(
  //     findElementOrNull(element, 'media:group'),
  //   ),
  //   contents: element.findElements('media:content').map((e) {
  //     return Content.parse(e);
  //   }).toList(),
  //   credits: element.findElements('media:credit').map((e) {
  //     return Credit.parse(e);
  //   }).toList(),
  //   category: Category.parse(
  //     findElementOrNull(element, 'media:category'),
  //   ),
  //   rating: Rating.parse(
  //     findElementOrNull(element, 'media:rating'),
  //   ),
  //   title: Title.parse(
  //     findElementOrNull(element, 'media:title'),
  //   ),
  //   description: Description.parse(
  //     findElementOrNull(element, 'media:description'),
  //   ),
  //   keywords: findElementOrNull(element, 'media:keywords')?.text,
  //   thumbnails: element.findElements('media:thumbnail').map((e) {
  //     return Thumbnail.parse(e);
  //   }).toList(),
  //   hash: Hash.parse(
  //     findElementOrNull(element, 'media:hash'),
  //   ),
  //   player: Player.parse(
  //     findElementOrNull(element, 'media:player'),
  //   ),
  //   copyright: Copyright.parse(
  //     findElementOrNull(element, 'media:copyright'),
  //   ),
  //   text: Text.parse(
  //     findElementOrNull(element, 'media:text'),
  //   ),
  //   restriction: Restriction.parse(
  //     findElementOrNull(element, 'media:restriction'),
  //   ),
  //   community: Community.parse(
  //     findElementOrNull(element, 'media:community'),
  //   ),
  //   comments: findElementOrNull(element, 'media:comments')
  //           ?.findElements('media:comment')
  //           ?.map((e) {
  //         return e.text;
  //       })?.toList() ??
  //       [],
  //   embed: Embed.parse(
  //     findElementOrNull(element, 'media:embed'),
  //   ),
  //   responses: findElementOrNull(element, 'media:responses')
  //           ?.findElements('media:response')
  //           ?.map((e) {
  //         return e.text;
  //       })?.toList() ??
  //       [],
  //   backLinks: findElementOrNull(element, 'media:backLinks')
  //           ?.findElements('media:backLink')
  //           ?.map((e) {
  //         return e.text;
  //       })?.toList() ??
  //       [],
  //   status: Status.parse(
  //     findElementOrNull(element, 'media:status'),
  //   ),
  //   prices: element.findElements('media:price').map((e) {
  //     return Price.parse(e);
  //   }).toList(),
  //   license: License.parse(
  //     findElementOrNull(element, 'media:license'),
  //   ),
  //   peerLink: PeerLink.parse(
  //     findElementOrNull(element, 'media:peerLink'),
  //   ),
  //   rights: Rights.parse(
  //     findElementOrNull(element, 'media:rights'),
  //   ),
  //   scenes: findElementOrNull(element, 'media:scenes')
  //           ?.findElements('media:scene')
  //           ?.map((e) {
  //         return Scene.parse(e);
  //       })?.toList() ??
  //       [],
  // );

  Object toJson() => serializers.serializeWith(Media.serializer, this);

  static Media fromJson(String jsonString) =>
      serializers.deserializeWith(Media.serializer, json.decode(jsonString));

  static Serializer<Media> get serializer => _$mediaSerializer;
}
