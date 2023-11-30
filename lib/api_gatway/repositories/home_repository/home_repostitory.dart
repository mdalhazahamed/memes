import 'package:dartz/dartz.dart';

import '../../../feature/home/data/dataSource/get_memes_data_source.dart';
import '../../../feature/home/data/model/response_get_memes.dart';
import '../../../feature/home/domain/entities/response_get_memes_entity.dart';
import '../../base_model/base_model.dart';

abstract class GetMemesRepository {
  Future<GetMemesResponseEntity?> getMemes();
  //Future<ServiceResponseEntity?> getServices(RequestEntity requestEntity);
}

class GetMemesRepositoryImpl implements GetMemesRepository {
  final GetMemesDataSource getMemesDataSource = GetMemesDataSourceImpl();

  GetMemesRepositoryImpl();

  @override
  Future<GetMemesResponseEntity?> getMemes() async {
    final Either<GetMemesResponseModel, BaseError>? response = await getMemesDataSource.getMemes();
    GetMemesResponseEntity? responseEntity;
    response?.fold((loginResponse) {
      responseEntity = loginResponse.toEntity();
    }, (error) => null);
    return responseEntity;
  }

  // @override
  // Future<ServiceResponseEntity?> getServices(RequestEntity requestEntity) async {
  //   final Either<ServiceResponseModel, BaseError>? response = await homeDataSource.getServices(requestEntity);
  //   ServiceResponseEntity? responseEntity;
  //   response?.fold((loginResponse) {
  //     responseEntity = loginResponse.toEntity();
  //   }, (error) => null);
  //   return responseEntity;
  // }
}
