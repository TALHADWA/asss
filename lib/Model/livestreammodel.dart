// To parse this JSON data, do
//
//     final liveStreamdf = liveStreamdfFromJson(jsonString);

import 'dart:convert';

LiveStreamdf liveStreamdfFromJson(String str) => LiveStreamdf.fromJson(json.decode(str));

String liveStreamdfToJson(LiveStreamdf data) => json.encode(data.toJson());

class LiveStreamdf {
    List<Datum>? data;
    Pagination? pagination;

    LiveStreamdf({
        this.data,
        this.pagination,
    });

    factory LiveStreamdf.fromJson(Map<String, dynamic> json) => LiveStreamdf(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Datum {
    String? liveStreamId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? streamKey;
    String? name;
    bool? public;
    bool? record;
    bool? broadcasting;
    Assets? assets;
    List<dynamic>? restreams;

    Datum({
        this.liveStreamId,
        this.createdAt,
        this.updatedAt,
        this.streamKey,
        this.name,
        this.public,
        this.record,
        this.broadcasting,
        this.assets,
        this.restreams,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        liveStreamId: json["liveStreamId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        streamKey: json["streamKey"],
        name: json["name"],
        public: json["public"],
        record: json["record"],
        broadcasting: json["broadcasting"],
        assets: json["assets"] == null ? null : Assets.fromJson(json["assets"]),
        restreams: json["restreams"] == null ? [] : List<dynamic>.from(json["restreams"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "liveStreamId": liveStreamId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "streamKey": streamKey,
        "name": name,
        "public": public,
        "record": record,
        "broadcasting": broadcasting,
        "assets": assets?.toJson(),
        "restreams": restreams == null ? [] : List<dynamic>.from(restreams!.map((x) => x)),
    };
}

class Assets {
    String? iframe;
    String? player;
    String? hls;
    String? thumbnail;

    Assets({
        this.iframe,
        this.player,
        this.hls,
        this.thumbnail,
    });

    factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        iframe: json["iframe"],
        player: json["player"],
        hls: json["hls"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "iframe": iframe,
        "player": player,
        "hls": hls,
        "thumbnail": thumbnail,
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
