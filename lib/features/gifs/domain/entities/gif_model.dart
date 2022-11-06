import 'dart:convert';

GifModel gifModelFromJson(String str) => GifModel.fromJson(json.decode(str));

String gifModelToJson(GifModel data) => json.encode(data.toJson());

class GifModel {
  GifModel({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.user,
    required this.analyticsResponsePayload,
    required this.analytics,
  });

  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  DateTime importDatetime;
  DateTime trendingDatetime;
  Images images;
  User user;
  String analyticsResponsePayload;
  Analytics analytics;

  factory GifModel.fromJson(Map<String, dynamic> json) => GifModel(
        type: json['type'],
        id: json['id'],
        url: json['url'],
        slug: json['slug'],
        bitlyGifUrl: json['bitly_gif_url'],
        bitlyUrl: json['bitly_url'],
        embedUrl: json['embed_url'],
        username: json['username'],
        source: json['source'],
        title: json['title'],
        rating: json['rating'],
        contentUrl: json['content_url'],
        sourceTld: json['source_tld'],
        sourcePostUrl: json['source_post_url'],
        isSticker: json['is_sticker'],
        importDatetime: DateTime.parse(json['import_datetime']),
        trendingDatetime: DateTime.parse(json['trending_datetime']),
        images: Images.fromJson(json['images']),
        user: User.fromJson(json['user']),
        analyticsResponsePayload: json['analytics_response_payload'],
        analytics: Analytics.fromJson(json['analytics']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'url': url,
        'slug': slug,
        'bitly_gif_url': bitlyGifUrl,
        'bitly_url': bitlyUrl,
        'embed_url': embedUrl,
        'username': username,
        'source': source,
        'title': title,
        'rating': rating,
        'content_url': contentUrl,
        'source_tld': sourceTld,
        'source_post_url': sourcePostUrl,
        'is_sticker': isSticker,
        'import_datetime': importDatetime.toIso8601String(),
        'trending_datetime': trendingDatetime.toIso8601String(),
        'images': images.toJson(),
        'user': user.toJson(),
        'analytics_response_payload': analyticsResponsePayload,
        'analytics': analytics.toJson(),
      };
}

class Analytics {
  Analytics({
    required this.onload,
    required this.onclick,
    required this.onsent,
  });

  Onclick onload;
  Onclick onclick;
  Onclick onsent;

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        onload: Onclick.fromJson(json['onload']),
        onclick: Onclick.fromJson(json['onclick']),
        onsent: Onclick.fromJson(json['onsent']),
      );

  Map<String, dynamic> toJson() => {
        'onload': onload.toJson(),
        'onclick': onclick.toJson(),
        'onsent': onsent.toJson(),
      };
}

class Onclick {
  Onclick({
    required this.url,
  });

  String url;

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}

class Images {
  Images({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.downsizedStill,
    required this.fixedHeight,
    required this.fixedHeightDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedHeightStill,
    required this.fixedWidth,
    required this.fixedWidthDownsampled,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.fixedWidthStill,
    required this.looping,
    required this.originalStill,
    required this.originalMp4,
    required this.preview,
    required this.previewGif,
    required this.previewWebp,
    required this.the480WStill,
  });

  FixedHeight original;
  The480WStill downsized;
  The480WStill downsizedLarge;
  The480WStill downsizedMedium;
  DownsizedSmall downsizedSmall;
  The480WStill downsizedStill;
  FixedHeight fixedHeight;
  FixedHeight fixedHeightDownsampled;
  FixedHeight fixedHeightSmall;
  The480WStill fixedHeightSmallStill;
  The480WStill fixedHeightStill;
  FixedHeight fixedWidth;
  FixedHeight fixedWidthDownsampled;
  FixedHeight fixedWidthSmall;
  The480WStill fixedWidthSmallStill;
  The480WStill fixedWidthStill;
  Looping looping;
  The480WStill originalStill;
  DownsizedSmall originalMp4;
  DownsizedSmall preview;
  The480WStill previewGif;
  The480WStill previewWebp;
  The480WStill the480WStill;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: FixedHeight.fromJson(json['original']),
        downsized: The480WStill.fromJson(json['downsized']),
        downsizedLarge: The480WStill.fromJson(json['downsized_large']),
        downsizedMedium: The480WStill.fromJson(json['downsized_medium']),
        downsizedSmall: DownsizedSmall.fromJson(json['downsized_small']),
        downsizedStill: The480WStill.fromJson(json['downsized_still']),
        fixedHeight: FixedHeight.fromJson(json['fixed_height']),
        fixedHeightDownsampled:
            FixedHeight.fromJson(json['fixed_height_downsampled']),
        fixedHeightSmall: FixedHeight.fromJson(json['fixed_height_small']),
        fixedHeightSmallStill:
            The480WStill.fromJson(json['fixed_height_small_still']),
        fixedHeightStill: The480WStill.fromJson(json['fixed_height_still']),
        fixedWidth: FixedHeight.fromJson(json['fixed_width']),
        fixedWidthDownsampled:
            FixedHeight.fromJson(json['fixed_width_downsampled']),
        fixedWidthSmall: FixedHeight.fromJson(json['fixed_width_small']),
        fixedWidthSmallStill:
            The480WStill.fromJson(json['fixed_width_small_still']),
        fixedWidthStill: The480WStill.fromJson(json['fixed_width_still']),
        looping: Looping.fromJson(json['looping']),
        originalStill: The480WStill.fromJson(json['original_still']),
        originalMp4: DownsizedSmall.fromJson(json['original_mp4']),
        preview: DownsizedSmall.fromJson(json['preview']),
        previewGif: The480WStill.fromJson(json['preview_gif']),
        previewWebp: The480WStill.fromJson(json['preview_webp']),
        the480WStill: The480WStill.fromJson(json['480w_still']),
      );

  Map<String, dynamic> toJson() => {
        'original': original.toJson(),
        'downsized': downsized.toJson(),
        'downsized_large': downsizedLarge.toJson(),
        'downsized_medium': downsizedMedium.toJson(),
        'downsized_small': downsizedSmall.toJson(),
        'downsized_still': downsizedStill.toJson(),
        'fixed_height': fixedHeight.toJson(),
        'fixed_height_downsampled': fixedHeightDownsampled.toJson(),
        'fixed_height_small': fixedHeightSmall.toJson(),
        'fixed_height_small_still': fixedHeightSmallStill.toJson(),
        'fixed_height_still': fixedHeightStill.toJson(),
        'fixed_width': fixedWidth.toJson(),
        'fixed_width_downsampled': fixedWidthDownsampled.toJson(),
        'fixed_width_small': fixedWidthSmall.toJson(),
        'fixed_width_small_still': fixedWidthSmallStill.toJson(),
        'fixed_width_still': fixedWidthStill.toJson(),
        'looping': looping.toJson(),
        'original_still': originalStill.toJson(),
        'original_mp4': originalMp4.toJson(),
        'preview': preview.toJson(),
        'preview_gif': previewGif.toJson(),
        'preview_webp': previewWebp.toJson(),
        '480w_still': the480WStill.toJson(),
      };
}

class The480WStill {
  The480WStill({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  String height;
  String width;
  String size;
  String url;

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

class DownsizedSmall {
  DownsizedSmall({
    required this.height,
    required this.width,
    required this.mp4Size,
    required this.mp4,
  });

  String height;
  String width;
  String mp4Size;
  String mp4;

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
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
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
    required this.frames,
    required this.hash,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String frames;
  String hash;

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
    required this.mp4Size,
    required this.mp4,
  });

  String mp4Size;
  String mp4;

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json['mp4_size'],
        mp4: json['mp4'],
      );

  Map<String, dynamic> toJson() => {
        'mp4_size': mp4Size,
        'mp4': mp4,
      };
}

class User {
  User({
    required this.avatarUrl,
    required this.bannerImage,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
    required this.description,
    required this.instagramUrl,
    required this.websiteUrl,
    required this.isVerified,
  });

  String avatarUrl;
  String bannerImage;
  String bannerUrl;
  String profileUrl;
  String username;
  String displayName;
  String description;
  String instagramUrl;
  String websiteUrl;
  bool isVerified;

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
