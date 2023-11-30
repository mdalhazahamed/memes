import 'package:get_memes/feature/home/data/model/get_memes.dart';
import 'package:get_memes/feature/home/domain/entities/get_memes_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../api_gatway/base_model/base_model.dart';
import '../../../../api_gatway/base_model/base_response.dart';
import '../../domain/entities/response_get_memes_entity.dart';

part 'response_get_memes.g.dart';

@JsonSerializable()
class GetMemesResponseModel extends BaseModel {
  @JsonKey(ignore: true)
  late final BaseResponse statusResponse;

  List<GetMemesModel>? memes;

  GetMemesResponseModel(
    this.memes,
  );

  factory GetMemesResponseModel.fromJson(Map<String, dynamic> json) => _$GetMemesResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMemesResponseModelToJson(this);

  GetMemesResponseEntity toEntity() {
    List<GetMemesEntity> memesEntity = [];
    for (var i = 0; i < memes!.length; i++) {
      memesEntity.add(memes![i].toEntites());
    }

    return GetMemesResponseEntity(memesEntity);
  }

  void setStatus(BaseResponse statusResponse) {
    this.statusResponse = statusResponse;
  }
}
