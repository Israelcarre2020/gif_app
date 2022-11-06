// To parse this JSON data, do
//
//     final gifModel = gifModelFromJson(jsonString);

// ignore_for_file: unnecessary_lambdas, constant_identifier_names, duplicate_ignore

import 'dart:convert';

GifAllDataModel gifModelFromJson(String str) =>
    GifAllDataModel.fromJson(json.decode(str));

String gifModelToJson(GifAllDataModel data) => json.encode(data.toJson());

class GifAllDataModel {
  GifAllDataModel({
    this.data,
    this.pagination,
    this.meta,
  });

  List<GifModelBase>? data;
  Pagination? pagination;
  Meta? meta;

  factory GifAllDataModel.fromJson(Map<String, dynamic> json) =>
      GifAllDataModel(
        data: json['data'] == null
            ? null
            : List<GifModelBase>.from(
                json['data'].map((x) => GifModelBase.fromJson(x))),
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination']),
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        'pagination': pagination == null ? null : pagination!.toJson(),
        'meta': meta == null ? null : meta!.toJson(),
      };
}

class GifModelBase {
  GifModelBase({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
    this.analytics,
  });

  Type? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  Rating? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  DateTime? importDatetime;
  dynamic trendingDatetime;
  Images? images;
  User? user;
  String? analyticsResponsePayload;
  Analytics? analytics;

  factory GifModelBase.fromJson(Map<String, dynamic> json) => GifModelBase(
        type: json['type'] = typeValues.map![json['type']],
        id: json['id'],
        url: json['url'],
        slug: json['slug'],
        bitlyGifUrl: json['bitly_gif_url'],
        bitlyUrl: json['bitly_url'],
        embedUrl: json['embed_url'],
        username: json['username'],
        source: json['source'],
        title: json['title'],
        rating:
            json['rating'] == null ? null : ratingValues.map![json['rating']],
        contentUrl: json['content_url'],
        sourceTld: json['source_tld'],
        sourcePostUrl: json['source_post_url'],
        isSticker: json['is_sticker'],
        importDatetime: json['import_datetime'] == null
            ? null
            : DateTime.parse(json['import_datetime']),
        trendingDatetime: json['trending_datetime'],
        images: json['images'] == null ? null : Images.fromJson(json['images']),
        user: json['user'] == null ? null : User.fromJson(json['user']),
        analyticsResponsePayload: json['analytics_response_payload'],
        analytics: json['analytics'] == null
            ? null
            : Analytics.fromJson(json['analytics']),
      );

  Map<String, dynamic> toJson() => {
        'type': type == null ? null : typeValues.reverse![type],
        'id': id,
        'url': url,
        'slug': slug,
        'bitly_gif_url': bitlyGifUrl,
        'bitly_url': bitlyUrl,
        'embed_url': embedUrl,
        'username': username,
        'source': source,
        'title': title,
        'rating': rating == null ? null : ratingValues.reverse![rating],
        'content_url': contentUrl,
        'source_tld': sourceTld,
        'source_post_url': sourcePostUrl,
        'is_sticker': isSticker,
        'import_datetime':
            importDatetime == null ? null : importDatetime!.toIso8601String(),
        'trending_datetime': trendingDatetime,
        'images': images == null ? null : images!.toJson(),
        'user': user == null ? null : user!.toJson(),
        'analytics_response_payload': analyticsResponsePayload,
        'analytics': analytics == null ? null : analytics!.toJson(),
      };
}

class Analytics {
  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  Onclick? onload;
  Onclick? onclick;
  Onclick? onsent;

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        onload:
            json['onload'] == null ? null : Onclick.fromJson(json['onload']),
        onclick:
            json['onclick'] == null ? null : Onclick.fromJson(json['onclick']),
        onsent:
            json['onsent'] == null ? null : Onclick.fromJson(json['onsent']),
      );

  Map<String, dynamic> toJson() => {
        'onload': onload == null ? null : onload!.toJson(),
        'onclick': onclick == null ? null : onclick!.toJson(),
        'onsent': onsent == null ? null : onsent!.toJson(),
      };
}

class Onclick {
  Onclick({
    this.url,
  });

  String? url;

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class Images {
  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.the480WStill,
    this.hd,
    this.the4K,
  });

  FixedHeight? original;
  The480WStill? downsized;
  The480WStill? downsizedLarge;
  The480WStill? downsizedMedium;
  The4K? downsizedSmall;
  The480WStill? downsizedStill;
  FixedHeight? fixedHeight;
  FixedHeight? fixedHeightDownsampled;
  FixedHeight? fixedHeightSmall;
  The480WStill? fixedHeightSmallStill;
  The480WStill? fixedHeightStill;
  FixedHeight? fixedWidth;
  FixedHeight? fixedWidthDownsampled;
  FixedHeight? fixedWidthSmall;
  The480WStill? fixedWidthSmallStill;
  The480WStill? fixedWidthStill;
  Looping? looping;
  The480WStill? originalStill;
  The4K? originalMp4;
  The4K? preview;
  The480WStill? previewGif;
  The480WStill? previewWebp;
  The480WStill? the480WStill;
  The4K? hd;
  The4K? the4K;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: json['original'] == null
            ? null
            : FixedHeight.fromJson(json['original']),
        downsized: json['downsized'] == null
            ? null
            : The480WStill.fromJson(json['downsized']),
        downsizedLarge: json['downsized_large'] == null
            ? null
            : The480WStill.fromJson(json['downsized_large']),
        downsizedMedium: json['downsized_medium'] == null
            ? null
            : The480WStill.fromJson(json['downsized_medium']),
        downsizedSmall: json['downsized_small'] == null
            ? null
            : The4K.fromJson(json['downsized_small']),
        downsizedStill: json['downsized_still'] == null
            ? null
            : The480WStill.fromJson(json['downsized_still']),
        fixedHeight: json['fixed_height'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_height']),
        fixedHeightDownsampled: json['fixed_height_downsampled'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_height_downsampled']),
        fixedHeightSmall: json['fixed_height_small'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_height_small']),
        fixedHeightSmallStill: json['fixed_height_small_still'] == null
            ? null
            : The480WStill.fromJson(json['fixed_height_small_still']),
        fixedHeightStill: json['fixed_height_still'] == null
            ? null
            : The480WStill.fromJson(json['fixed_height_still']),
        fixedWidth: json['fixed_width'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_width']),
        fixedWidthDownsampled: json['fixed_width_downsampled'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_width_downsampled']),
        fixedWidthSmall: json['fixed_width_small'] == null
            ? null
            : FixedHeight.fromJson(json['fixed_width_small']),
        fixedWidthSmallStill: json['fixed_width_small_still'] == null
            ? null
            : The480WStill.fromJson(json['fixed_width_small_still']),
        fixedWidthStill: json['fixed_width_still'] == null
            ? null
            : The480WStill.fromJson(json['fixed_width_still']),
        looping:
            json['looping'] == null ? null : Looping.fromJson(json['looping']),
        originalStill: json['original_still'] == null
            ? null
            : The480WStill.fromJson(json['original_still']),
        originalMp4: json['original_mp4'] == null
            ? null
            : The4K.fromJson(json['original_mp4']),
        preview:
            json['preview'] == null ? null : The4K.fromJson(json['preview']),
        previewGif: json['preview_gif'] == null
            ? null
            : The480WStill.fromJson(json['preview_gif']),
        previewWebp: json['preview_webp'] == null
            ? null
            : The480WStill.fromJson(json['preview_webp']),
        the480WStill: json['480w_still'] == null
            ? null
            : The480WStill.fromJson(json['480w_still']),
        hd: json['hd'] == null ? null : The4K.fromJson(json['hd']),
        the4K: json['4k'] == null ? null : The4K.fromJson(json['4k']),
      );

  Map<String, dynamic> toJson() => {
        'original': original == null ? null : original!.toJson(),
        'downsized': downsized == null ? null : downsized!.toJson(),
        'downsized_large':
            downsizedLarge == null ? null : downsizedLarge!.toJson(),
        'downsized_medium':
            downsizedMedium == null ? null : downsizedMedium!.toJson(),
        'downsized_still':
            downsizedStill == null ? null : downsizedStill!.toJson(),
        'fixed_height': fixedHeight == null ? null : fixedHeight!.toJson(),
        'fixed_height_downsampled': fixedHeightDownsampled == null
            ? null
            : fixedHeightDownsampled!.toJson(),
        'fixed_height_small':
            fixedHeightSmall == null ? null : fixedHeightSmall!.toJson(),
        'fixed_height_small_still': fixedHeightSmallStill == null
            ? null
            : fixedHeightSmallStill!.toJson(),
        'fixed_height_still':
            fixedHeightStill == null ? null : fixedHeightStill!.toJson(),
        'fixed_width': fixedWidth == null ? null : fixedWidth!.toJson(),
        'fixed_width_downsampled': fixedWidthDownsampled == null
            ? null
            : fixedWidthDownsampled!.toJson(),
        'fixed_width_small':
            fixedWidthSmall == null ? null : fixedWidthSmall!.toJson(),
        'fixed_width_small_still': fixedWidthSmallStill == null
            ? null
            : fixedWidthSmallStill!.toJson(),
        'fixed_width_still':
            fixedWidthStill != null ? fixedWidthStill!.toJson() : '',
        'looping': looping == null ? null : looping!.toJson(),
        'original_still':
            originalStill == null ? null : originalStill!.toJson(),
        'original_mp4': originalMp4 == null ? null : originalMp4!.toJson(),
        'preview': preview == null ? null : preview!.toJson(),
        'preview_gif': previewGif == null ? null : previewGif!.toJson(),
        'preview_webp': previewWebp == null ? null : previewWebp!.toJson(),
        '480w_still': the480WStill == null ? null : the480WStill!.toJson(),
        'hd': hd == null ? null : hd!.toJson(),
        '4k': the4K == null ? null : the4K!.toJson(),
      };
}

class The480WStill {
  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });

  String? height;
  String? width;
  String? size;
  String? url;

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
      };
}

class The4K {
  The4K({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });

  String? height;
  String? width;
  String? mp4Size;
  String? mp4;

  factory The4K.fromJson(Map<String, dynamic> json) => The4K(
        height: json['height'],
        width: json['width'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

class FixedHeight {
  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json['height'],
        width: json['width'],
        size: json['size'],
        url: json['url'],
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
        webpSize: json['webp_size'],
        webp: json['webp'],
        frames: json['frames'],
        hash: json['hash'],
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'width': width,
        'size': size,
        'url': url,
        'mp4_size': mp4Size,
        'mp4': mp4,
        'webp_size': webpSize,
        'webp': webp,
        'frames': frames,
        'hash': hash,
      };
}

class Looping {
  Looping({
    this.mp4Size,
    this.mp4,
  });

  String? mp4Size;
  String? mp4;

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

// ignore: constant_identifier_names
enum Rating { G, PG }

final ratingValues = EnumValues({'g': Rating.G, 'pg': Rating.PG});

enum TrendingDatetimeEnum { THE_00000000000000 }

final trendingDatetimeEnumValues = EnumValues(
    {'0000-00-00 00:00:00': TrendingDatetimeEnum.THE_00000000000000});

enum Type { GIF }

final typeValues = EnumValues({'gif': Type.GIF});

class User {
  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });

  String? avatarUrl;
  String? bannerImage;
  String? bannerUrl;
  String? profileUrl;
  String? username;
  String? displayName;
  String? description;
  String? instagramUrl;
  String? websiteUrl;
  bool? isVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatarUrl: json['avatar_url'],
        bannerImage: json['banner_image'],
        bannerUrl: json['banner_url'],
        profileUrl: json['profile_url'],
        username: json['username'],
        displayName: json['display_name'],
        description: json['description'],
        instagramUrl: json['instagram_url'],
        websiteUrl: json['website_url'],
        isVerified: json['is_verified'],
      );

  Map<String, dynamic> toJson() => {
        'avatar_url': avatarUrl,
        'banner_image': bannerImage,
        'banner_url': bannerUrl,
        'profile_url': profileUrl,
        'username': username,
        'display_name': displayName,
        'description': description,
        'instagram_url': instagramUrl,
        'website_url': websiteUrl,
        'is_verified': isVerified,
      };
}

class Meta {
  Meta({
    this.status,
    this.msg,
    this.responseId,
  });

  int? status;
  String? msg;
  String? responseId;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json['status'],
        msg: json['msg'],
        responseId: json['response_id'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'response_id': responseId,
      };
}

class Pagination {
  Pagination({
    this.totalCount,
    this.count,
    this.offset,
  });

  int? totalCount;
  int? count;
  int? offset;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json['total_count'],
        count: json['count'],
        offset: json['offset'],
      );

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'count': count,
        'offset': offset,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    // ignore: join_return_with_assignment
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
