// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/get_memes_entity.dart';

part 'get_memes.g.dart';

@JsonSerializable()
class GetMemesModel {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? box_count;
  int? captions;

  GetMemesModel(
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.box_count,
    this.captions,
  );

  factory GetMemesModel.fromJson(Map<String, dynamic> json) => _$GetMemesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMemesModelToJson(this);

  GetMemesEntity toEntites() {
    return GetMemesEntity(
      this.id,
      this.name,
      this.url,
      this.width,
      this.height,
      this.box_count,
      this.captions,
    );
  }
}
