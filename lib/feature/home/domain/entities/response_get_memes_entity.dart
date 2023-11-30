import 'package:get_memes/feature/home/data/model/get_memes.dart';
import 'package:get_memes/feature/home/domain/entities/get_memes_entity.dart';

class GetMemesResponseEntity {
  List<GetMemesEntity>? memes;

  GetMemesResponseEntity(
    this.memes,
  );
}
