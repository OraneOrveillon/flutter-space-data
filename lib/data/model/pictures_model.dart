import 'dart:convert';

Pictures picturesFromMap(String str) => Pictures.fromMap(json.decode(str));

String picturesToMap(Pictures data) => json.encode(data.toMap());

class Pictures {
  Pictures({
    required this.collection,
  });

  final Collection? collection;

  factory Pictures.fromMap(Map<String, dynamic> json) => Pictures(
        collection: json["collection"] == null ? null : Collection.fromMap(json["collection"]),
      );

  Map<String, dynamic> toMap() => {
        "collection": collection == null ? null : collection!.toMap(),
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
  final List<Item>? items;
  final Metadata? metadata;
  final List<CollectionLink>? links;

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
        version: json["version"],
        href: json["href"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        metadata: json["metadata"] == null ? null : Metadata.fromMap(json["metadata"]),
        links: json["links"] == null
            ? null
            : List<CollectionLink>.from(json["links"].map((x) => CollectionLink.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "href": href,
        "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toMap())),
        "metadata": metadata == null ? null : metadata!.toMap(),
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    required this.href,
    required this.data,
    required this.links,
  });

  final String href;
  final List<Datum>? data;
  final List<ItemLink>? links;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        href: json["href"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        links: json["links"] == null ? null : List<ItemLink>.from(json["links"].map((x) => ItemLink.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toMap())),
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
    required this.description,
    required this.description508,
    required this.secondaryCreator,
    required this.album,
    required this.location,
    required this.photographer,
  });

  final Center? center;
  final String? title;
  final String? nasaId;
  final MediaType? mediaType;
  final List<String>? keywords;
  final DateTime? dateCreated;
  final String? description;
  final String? description508;
  final String? secondaryCreator;
  final List<String?>? album;
  final String? location;
  final String? photographer;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        center: json["center"] == null ? null : centerValues.map[json["center"]],
        title: json["title"],
        nasaId: json["nasa_id"],
        mediaType: json["media_type"] == null ? null : mediaTypeValues.map[json["media_type"]],
        keywords: json["keywords"] == null ? null : List<String>.from(json["keywords"].map((x) => x)),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        description: json["description"],
        description508: json["description_508"],
        secondaryCreator: json["secondary_creator"],
        album: json["album"] == null ? null : List<String>.from(json["album"].map((x) => x)),
        location: json["location"],
        photographer: json["photographer"],
      );

  Map<String, dynamic> toMap() => {
        "center": center == null ? null : centerValues.reverse[center],
        "title": title,
        "nasa_id": nasaId,
        "media_type": mediaType == null ? null : mediaTypeValues.reverse[mediaType],
        "keywords": keywords == null ? null : List<dynamic>.from(keywords!.map((x) => x)),
        "date_created": dateCreated == null ? null : dateCreated!.toIso8601String(),
        "description": description,
        "description_508": description508,
        "secondary_creator": secondaryCreator,
        "album": album == null ? null : List<dynamic>.from(album!.map((x) => x)),
        "location": location,
        "photographer": photographer,
      };
}

enum Center { hq, jsc, jpl, gsfc, afrc, msfc, ksc }

final centerValues = EnumValues({
  "AFRC": Center.afrc,
  "GSFC": Center.gsfc,
  "HQ": Center.hq,
  "JPL": Center.jpl,
  "JSC": Center.jsc,
  "KSC": Center.ksc,
  "MSFC": Center.msfc
});

enum MediaType { video, audio, image }

final mediaTypeValues = EnumValues({"audio": MediaType.audio, "image": MediaType.image, "video": MediaType.video});

class ItemLink {
  ItemLink({
    required this.href,
    required this.rel,
    required this.render,
  });

  final String? href;
  final Rel? rel;
  final MediaType? render;

  factory ItemLink.fromMap(Map<String, dynamic> json) => ItemLink(
        href: json["href"],
        rel: json["rel"] == null ? null : relValues.map[json["rel"]],
        render: json["render"] == null ? null : mediaTypeValues.map[json["render"]],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "rel": rel == null ? null : relValues.reverse[rel],
        "render": render == null ? null : mediaTypeValues.reverse[render],
      };
}

enum Rel { preview, captions }

final relValues = EnumValues({"captions": Rel.captions, "preview": Rel.preview});

class CollectionLink {
  CollectionLink({
    required this.rel,
    required this.prompt,
    required this.href,
  });

  final String? rel;
  final String? prompt;
  final String? href;

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
