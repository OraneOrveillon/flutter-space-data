import 'dart:convert';

PicturesModel bodyFromMap(String str) => PicturesModel.fromMap(json.decode(str));

String bodyToMap(PicturesModel data) => json.encode(data.toMap());

class PicturesModel {
  PicturesModel({
    required this.collection,
  });

  final Collection collection;

  factory PicturesModel.fromMap(Map<String, dynamic> json) => PicturesModel(
        collection: Collection.fromMap(json["collection"]),
      );

  Map<String, dynamic> toMap() => {
        "collection": collection.toMap(),
      };
}

class Collection {
  Collection({
    required this.version,
    required this.href,
    required this.items,
    required this.metadata,
    required this.links,
  });

  final String version;
  final String href;
  final List<Item> items;
  final Metadata metadata;
  final List<CollectionLink> links;

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        version: json["version"],
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        metadata: Metadata.fromMap(json["metadata"]),
        links: List<CollectionLink>.from(json["links"].map((x) => CollectionLink.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "metadata": metadata.toMap(),
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    required this.href,
    required this.data,
    required this.links,
  });

  final String href;
  final List<Datum> data;
  final List<ItemLink> links;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        href: json["href"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        links: List<ItemLink>.from(json["links"].map((x) => ItemLink.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "links": List<dynamic>.from(links.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.center,
    required this.title,
    required this.nasaId,
    required this.mediaType,
    required this.keywords,
    required this.dateCreated,
    required this.description508,
    required this.secondaryCreator,
    required this.description,
    required this.photographer,
    required this.album,
    required this.location,
  });

  final Center? center;
  final String title;
  final String nasaId;
  final MediaType? mediaType;
  final List<Keyword> keywords;
  final DateTime dateCreated;
  final String description508;
  final String secondaryCreator;
  final String description;
  final String photographer;
  final List<Keyword>? album;
  final String location;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        center: centerValues.map[json["center"]],
        title: json["title"],
        nasaId: json["nasa_id"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        keywords: List<Keyword>.from(json["keywords"].map((x) => keywordValues.map[x])),
        dateCreated: DateTime.parse(json["date_created"]),
        description508: json["description_508"],
        secondaryCreator: json["secondary_creator"],
        description: json["description"],
        photographer: json["photographer"],
        album: json["album"] == null ? null : List<Keyword>.from(json["album"].map((x) => keywordValues.map[x])),
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "center": centerValues.reverse[center],
        "title": title,
        "nasa_id": nasaId,
        "media_type": mediaTypeValues.reverse[mediaType],
        "keywords": List<dynamic>.from(keywords.map((x) => keywordValues.reverse[x])),
        "date_created": dateCreated.toIso8601String(),
        "description_508": description508,
        "secondary_creator": secondaryCreator,
        "description": description,
        "photographer": photographer,
        "album": album == null ? null : List<dynamic>.from(album!.map((x) => keywordValues.reverse[x])),
        "location": location,
      };
}

enum Keyword {
  SATURN,
  VOYAGER,
  CASSINI_HUYGENS,
  CASSINI,
  HUBBLE_SPACE_TELESCOPE,
  W_M_KECK_OBSERVATORY,
  SATURN_V,
  LAUNCH,
  ULTIMATE,
  PLANETS,
  MOON,
  RINGS,
  CASSINI_HUYGENS_HUBBLE_SPACE_TELESCOPE
}

final keywordValues = EnumValues({
  "Cassini": Keyword.CASSINI,
  "Cassini-Huygens": Keyword.CASSINI_HUYGENS,
  "Cassini-Huygens,Hubble Space Telescope": Keyword.CASSINI_HUYGENS_HUBBLE_SPACE_TELESCOPE,
  "Hubble Space Telescope": Keyword.HUBBLE_SPACE_TELESCOPE,
  "Launch": Keyword.LAUNCH,
  "Moon": Keyword.MOON,
  "Planets": Keyword.PLANETS,
  "Rings": Keyword.RINGS,
  "Saturn": Keyword.SATURN,
  "Saturn V": Keyword.SATURN_V,
  "Ultimate": Keyword.ULTIMATE,
  "Voyager": Keyword.VOYAGER,
  "W. M. Keck Observatory": Keyword.W_M_KECK_OBSERVATORY
});

enum Center { JPL, HQ, MSFC, GSFC }

final centerValues = EnumValues({"GSFC": Center.GSFC, "HQ": Center.HQ, "JPL": Center.JPL, "MSFC": Center.MSFC});

enum MediaType { IMAGE, VIDEO }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE, "video": MediaType.VIDEO});

class ItemLink {
  ItemLink({
    required this.href,
    required this.rel,
    required this.render,
  });

  final String href;
  final Rel? rel;
  final MediaType? render;

  factory ItemLink.fromMap(Map<String, dynamic> json) => ItemLink(
        href: json["href"],
        rel: relValues.map[json["rel"]],
        render: json["render"] == null ? null : mediaTypeValues.map[json["render"]],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "rel": relValues.reverse[rel],
        "render": render == null ? null : mediaTypeValues.reverse[render],
      };
}

enum Rel { PREVIEW, CAPTIONS }

final relValues = EnumValues({"captions": Rel.CAPTIONS, "preview": Rel.PREVIEW});

class CollectionLink {
  CollectionLink({
    required this.rel,
    required this.prompt,
    required this.href,
  });

  final String rel;
  final String prompt;
  final String href;

  factory CollectionLink.fromMap(Map<String, dynamic> json) => CollectionLink(
        rel: json["rel"],
        prompt: json["prompt"],
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "rel": rel,
        "prompt": prompt,
        "href": href,
      };
}

class Metadata {
  Metadata({
    required this.totalHits,
  });

  final int totalHits;

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        totalHits: json["total_hits"],
      );

  Map<String, dynamic> toMap() => {
        "total_hits": totalHits,
      };
}

class EnumValues<T> {
  late final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
