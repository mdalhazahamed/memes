// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_get_memes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMemesResponseModel _$GetMemesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetMemesResponseModel(
      (json['memes'] as List<dynamic>?)
          ?.map((e) => GetMemesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMemesResponseModelToJson(
        GetMemesResponseModel instance) =>
    <String, dynamic>{
      'memes': instance.memes,
    };
