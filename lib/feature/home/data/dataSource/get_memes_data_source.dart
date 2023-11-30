// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:dartz/dartz.dart';
import 'package:get_memes/api_gatway/api_collection/home_api/home_api.dart';
import 'package:get_memes/feature/home/data/model/response_get_memes.dart';

import '../../../../api_gatway/base_model/base_data_source.dart';
import '../../../../api_gatway/base_model/base_model.dart';

abstract class GetMemesDataSource {
  Future<Either<GetMemesResponseModel, BaseError>?> getMemes();

  // Future<Either<ServiceResponseModel, BaseError>?> getServices(RequestEntity requestEntity);
}

class GetMemesDataSourceImpl extends BaseDataSource implements GetMemesDataSource {
  final BaseError baseError = BaseError();
  final GetMemesApi getMemesApi = GetMemesApi();
  // final ServiceApi api = ServiceApi();

  GetMemesDataSourceImpl();

  @override
  Future<Either<GetMemesResponseModel, BaseError>?> getMemes() async {
    final Either<GetMemesResponseModel, BaseError>? response = await getMemesApi.get(
      headers: super.authHeaders,
    );
    return response;
  }

  // @override
  // Future<Either<ServiceResponseModel, BaseError>?> getServices(RequestEntity requestEntity) async {
  //   final Either<ServiceResponseModel, BaseError>? response = await api.get(
  //     headers: super.authHeaders,
  //     param: "/" + requestEntity.id.toString(),
  //   );
  //   return response;
  // }
}
