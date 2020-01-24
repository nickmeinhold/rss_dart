// GENERATED CODE - DO NOT MODIFY BY HAND

part of rss_feed;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RssFeed> _$rssFeedSerializer = new _$RssFeedSerializer();

class _$RssFeedSerializer implements StructuredSerializer<RssFeed> {
  @override
  final Iterable<Type> types = const [RssFeed, _$RssFeed];
  @override
  final String wireName = 'RssFeed';

  @override
  Iterable<Object> serialize(Serializers serializers, RssFeed object,
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
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(RssItem)])),
    ];
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RssFeed deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RssFeedBuilder();

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
        case 'author':
          result.author = serializers.deserialize(value,
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
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RssItem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$RssFeed extends RssFeed {
  @override
  final String title;
  @override
  final String author;
  @override
  final String description;
  @override
  final String link;
  @override
  final BuiltList<RssItem> items;

  factory _$RssFeed([void Function(RssFeedBuilder) updates]) =>
      (new RssFeedBuilder()..update(updates)).build();

  _$RssFeed._(
      {this.title, this.author, this.description, this.link, this.items})
      : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('RssFeed', 'title');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('RssFeed', 'description');
    }
    if (link == null) {
      throw new BuiltValueNullFieldError('RssFeed', 'link');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('RssFeed', 'items');
    }
  }

  @override
  RssFeed rebuild(void Function(RssFeedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RssFeedBuilder toBuilder() => new RssFeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RssFeed &&
        title == other.title &&
        author == other.author &&
        description == other.description &&
        link == other.link &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, title.hashCode), author.hashCode),
                description.hashCode),
            link.hashCode),
        items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RssFeed')
          ..add('title', title)
          ..add('author', author)
          ..add('description', description)
          ..add('link', link)
          ..add('items', items))
        .toString();
  }
}

class RssFeedBuilder implements Builder<RssFeed, RssFeedBuilder> {
  _$RssFeed _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _link;
  String get link => _$this._link;
  set link(String link) => _$this._link = link;

  ListBuilder<RssItem> _items;
  ListBuilder<RssItem> get items =>
      _$this._items ??= new ListBuilder<RssItem>();
  set items(ListBuilder<RssItem> items) => _$this._items = items;

  RssFeedBuilder();

  RssFeedBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _author = _$v.author;
      _description = _$v.description;
      _link = _$v.link;
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RssFeed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RssFeed;
  }

  @override
  void update(void Function(RssFeedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RssFeed build() {
    _$RssFeed _$result;
    try {
      _$result = _$v ??
          new _$RssFeed._(
              title: title,
              author: author,
              description: description,
              link: link,
              items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RssFeed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
