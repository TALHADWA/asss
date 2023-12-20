// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

Temperatures temperaturesFromJson(String str) => Temperatures.fromJson(json.decode(str));

String temperaturesToJson(Temperatures data) => json.encode(data.toJson());

class Temperatures {
    List<Datum>? data;
    Pagination? pagination;

    Temperatures({
        this.data,
        this.pagination,
    });

    factory Temperatures.fromJson(Map<String, dynamic> json) => Temperatures(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Datum {
    String? videoId;
    String? title;
    String? description;
    bool? public;
    bool? panoramic;
    bool? mp4Support;
    DateTime? publishedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<dynamic>? tags;
    List<dynamic>? metadata;
    Source? source;
    Assets? assets;

    Datum({
        this.videoId,
        this.title,
        this.description,
        this.public,
        this.panoramic,
        this.mp4Support,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.tags,
        this.metadata,
        this.source,
        this.assets,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        videoId: json["videoId"],
        title: json["title"],
        description: json["description"],
        public: json["public"],
        panoramic: json["panoramic"],
        mp4Support: json["mp4Support"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
        metadata: json["metadata"] == null ? [] : List<dynamic>.from(json["metadata"]!.map((x) => x)),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        assets: json["assets"] == null ? null : Assets.fromJson(json["assets"]),
    );

    Map<String, dynamic> toJson() => {
        "videoId": videoId,
        "title": title,
        "description": description,
        "public": public,
        "panoramic": panoramic,
        "mp4Support": mp4Support,
        "publishedAt": publishedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "metadata": metadata == null ? [] : List<dynamic>.from(metadata!.map((x) => x)),
        "source": source?.toJson(),
        "assets": assets?.toJson(),
    };
}

class Assets {
    String? iframe;
    String? player;
    String? hls;
    String? thumbnail;
    String? mp4;

    Assets({
        this.iframe,
        this.player,
        this.hls,
        this.thumbnail,
        this.mp4,
    });

    factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        iframe: json["iframe"],
        player: json["player"],
        hls: json["hls"],
        thumbnail: json["thumbnail"],
        mp4: json["mp4"],
    );

    Map<String, dynamic> toJson() => {
        "iframe": iframe,
        "player": player,
        "hls": hls,
        "thumbnail": thumbnail,
        "mp4": mp4,
    };
}

class Source {
    String? type;
    String? uri;
    LiveStream? liveStream;

    Source({
        this.type,
        this.uri,
        this.liveStream,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        type: json["type"],
        uri: json["uri"],
        liveStream: json["liveStream"] == null ? null : LiveStream.fromJson(json["liveStream"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "uri": uri,
        "liveStream": liveStream?.toJson(),
    };
}

class LiveStream {
    String? liveStreamId;
    List<Link>? links;

    LiveStream({
        this.liveStreamId,
        this.links,
    });

    factory LiveStream.fromJson(Map<String, dynamic> json) => LiveStream(
        liveStreamId: json["liveStreamId"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "liveStreamId": liveStreamId,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    };
}

class Link {
    String? rel;
    String? uri;

    Link({
        this.rel,
        this.uri,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "rel": rel,
        "uri": uri,
    };
}

class Pagination {
    int? currentPage;
    int? currentPageItems;
    int? pageSize;
    int? pagesTotal;
    int? itemsTotal;
    List<Link>? links;

    Pagination({
        this.currentPage,
        this.currentPageItems,
        this.pageSize,
        this.pagesTotal,
        this.itemsTotal,
        this.links,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["currentPage"],
        currentPageItems: json["currentPageItems"],
        pageSize: json["pageSize"],
        pagesTotal: json["pagesTotal"],
        itemsTotal: json["itemsTotal"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "currentPageItems": currentPageItems,
        "pageSize": pageSize,
        "pagesTotal": pagesTotal,
        "itemsTotal": itemsTotal,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    };
}
