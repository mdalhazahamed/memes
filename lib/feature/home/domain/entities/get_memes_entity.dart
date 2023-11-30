import 'package:json_annotation/json_annotation.dart';

class GetMemesEntity {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? box_count;
  int? captions;

  GetMemesEntity(
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.box_count,
    this.captions,
  );
}
