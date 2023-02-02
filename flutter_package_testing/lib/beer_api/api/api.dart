import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  return dio;
}

@riverpod
Future<Response> getData(
  GetDataRef ref, {
  required String url,
  String? arguments,
  Map<String, dynamic>? queryParameters,
  bool isKeepAlive = true,
}) async {
  Dio dio = ref.watch(dioProvider);
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  final response = await dio.get(
    arguments != null ? '$url/$arguments' : url,
    queryParameters: queryParameters,
    cancelToken: cancelToken,
  );
  if (isKeepAlive) ref.keepAlive();
  return response;
}
