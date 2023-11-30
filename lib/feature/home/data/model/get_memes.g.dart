// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_memes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemesModel _$GetMemesModelFromJson(Map<String, dynamic> json) =>
    GetMemesModel(
      json['id'] as String?,
      json['name'] as String?,
      json['url'] as String?,
      json['width'] as int?,
      json['height'] as int?,
      json['box_count'] as int?,
      json['captions'] as int?,
    );

Map<String, dynamic> _$GetMemesModelToJson(GetMemesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'box_count': instance.box_count,
      'captions': instance.captions,
    };
