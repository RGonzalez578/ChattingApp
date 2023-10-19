// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiImage_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiImage _$ApiImageFromJson(Map<String, dynamic> json) => ApiImage(
      id: json['id'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      photographerUrl: json['photographer_url'] as String,
      photographerId: json['photographer_id'] as int,
      avgColor: json['avg_color'] as String,
      sizes: ImageSizes.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
      altText: json['alt'] as String,
    );

Map<String, dynamic> _$ApiImageToJson(ApiImage instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'src': instance.sizes,
      'liked': instance.liked,
      'alt': instance.altText,
    };
