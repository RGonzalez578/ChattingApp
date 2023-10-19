// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_image_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseImageApi _$ResponseImageApiFromJson(Map<String, dynamic> json) =>
    ResponseImageApi(
      page: json['page'] as int?,
      photosPerPage: json['per_page'] as int?,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => ApiImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseImageApiToJson(ResponseImageApi instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.photosPerPage,
      'photos': instance.photos,
    };
