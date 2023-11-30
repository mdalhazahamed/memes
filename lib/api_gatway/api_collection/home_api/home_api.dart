import 'package:get_memes/feature/home/data/model/response_get_memes.dart';

import '../../base_model/api_provider.dart';
import '../../base_model/base_model.dart';
import '../../base_model/base_api.dart';
import '../../base_model/base_request.dart';
import '../../base_model/base_response.dart';
import '../api_names.dart';

class GetMemesApi extends BaseApi<BaseRequest, GetMemesResponseModel, BaseError> {
  GetMemesApi() : super(ApiNames.get_memes, ApiProvider(), BaseError());
  @override
  BaseModel mapResponse(Map<String, dynamic>? responseJson) {
    final BaseResponse base = BaseResponse.fromJson(responseJson ?? {});
    final GetMemesResponseModel response = GetMemesResponseModel.fromJson(responseJson!["data"]);

    response.setStatus(base);
    return response;
  }
}
