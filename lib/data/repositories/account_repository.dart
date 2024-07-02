import 'package:template/core/export/core_export.dart';
import 'package:template/data/data_source/dio/dio_client.dart';
import 'package:template/data/data_source/exception/api_error_handler.dart';
import 'package:template/data/model/auth/auth_response.dart';
import 'package:template/data/model/base/api_response.dart';
import 'package:template/domain/end_points/end_point.dart';

class AccountRepository {
  final _dio = sl.get<DioClient>();

  Future<void> getUser(
      {required Function(UserModel data) onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      final response = await _dio
          .get('${EndPoint.USER}/${sl<SharedPreferenceHelper>().getIdUser}');
      onSuccess(UserModel.fromJson(response.data as Map<String, dynamic>));
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> updateUser(
      {required UserModel user,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.put(
        '${EndPoint.USER}/${sl<SharedPreferenceHelper>().getIdUser}',
        data: user.toMap(),
      );
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> deleteUser(
      {required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.delete(
        '${EndPoint.USER}/${sl<SharedPreferenceHelper>().getIdUser}/appType/$NAIL_SUPPLY',
      );
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> updateLanguageUser({
    required String lang,
    required Function() onSuccess,
    required Function(dynamic error) onError,
  }) async {
    try {
      await _dio.put(
        '${EndPoint.USER}/${sl<SharedPreferenceHelper>().getIdUser}',
        data: {'language': lang},
      );
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> addPointShare(
      {required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      await _dio.put(
          '${EndPoint.USER_V1}/${sl<SharedPreferenceHelper>().getIdUser}/share-nail-supply');
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> addPointShareApp(
      {required String idStore,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      final Map<String, dynamic> _data = {
        'idStore': idStore,
        'appType': 'NAIL_SUPPLY',
      };
      await _dio.put(
          '${EndPoint.USER_V1}/${sl<SharedPreferenceHelper>().getIdUser}/share',
          data: _data);
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }

  Future<void> updateUserAdmin(
      {required String idUser,
      required String name,
      String? avatar,
      required Function() onSuccess,
      required Function(dynamic error) onError}) async {
    try {
      dynamic data;
      if (avatar != null) {
        data = {'fullName': name, 'avatar': avatar};
      } else {
        data = {'fullName': name};
      }
      await _dio.put(
        '${EndPoint.USER}/$idUser',
        data: data,
      );
      onSuccess();
    } catch (e) {
      onError(ApiResponse.withError(ApiErrorHandler.getMessage(e)).error);
    }
  }
}
