import 'dart:developer' as dev;
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_enum.dart';
import '../../extension/network_extension.dart';
import 'i_core_dio.dart';
import 'i_response_model.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      dynamic headers,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      final response = await request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            method: type.rawValue,
            headers: headers,
          ));

      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<R, T>(parseModel, response.data);
          return ResponseModel<R>(data: model);
        default:
          return ResponseModel(
              error: BaseError(
                  "The Http request has been failed. Status Code : )"));
      }
    } on DioError catch (e) {
      dev.log(e.message);
      return ResponseModel(error: BaseError(e.message));
    }
  }
}
