import 'package:template/core/export/core_export.dart';
import 'package:template/data/data_source/dio/dio_client.dart';
import 'package:template/data/data_source/exception/api_error_handler.dart';
import 'package:template/data/model/base/api_response.dart';
import 'package:template/data/model/provider/provider_model.dart';
import 'package:template/data/model/provider/provider_param.dart';
import 'package:template/domain/end_points/end_point.dart';

class ProviderRepository {
  final _dio = sl.get<DioClient>();

  Future<void> getProvider(
      {required ProviderParam providerParam,
      required Function(ProviderResponse data) onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      final response = await _dio.get(
        EndPoint.PROVIDER,
        queryParameters: providerParam.toJson(),
      );
      onSuccess(
          ProviderResponse.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

}
