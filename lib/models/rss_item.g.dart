// GENERATED CODE - DO NOT MODIFY BY HAND

part of rss_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RssItem> _$rssItemSerializer = new _$RssItemSerializer();

class _$RssItemSerializer implements StructuredSerializer<RssItem> {
  @override
  final Iterable<Type> types = const [RssItem, _$RssItem];
  @override
  final String wireName = 'RssItem';

  @override
  Iterable<Object> serialize(Serializers serializers, RssItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RssItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RssItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RssItem extends RssItem {
  @override
  final String title;
  @override
  final String description;
  @override
  final String link;

  factory _$RssItem([void Function(RssItemBuilder) updates]) =>
      (new RssItemBuilder()..update(updates)).build();

  _$RssItem._({this.title, this.description, this.link}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('RssItem', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('RssItem', 'description');
    }
    if (link == null) {
      throw new BuiltValueNullFieldError('RssItem', 'link');
    }
  }

  @override
  RssItem rebuild(void Function(RssItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RssItemBuilder toBuilder() => new RssItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RssItem &&
        title == other.title &&
        description == other.description &&
        link == other.link;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), description.hashCode), link.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RssItem')
          ..add('title', title)
          ..add('description', description)
          ..add('link', link))
        .toString();
  }
}

class RssItemBuilder implements Builder<RssItem, RssItemBuilder> {
  _$RssItem _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  RssItemBuilder();

  RssItemBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _description = _$v.description;
      _link = _$v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RssItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RssItem;
  }

  @override
  void update(void Function(RssItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RssItem build() {
    final _$result = _$v ??
        new _$RssItem._(title: title, description: description, link: link);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
