import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:untitled3/data/source/remote/response/currency_responce.dart';
import 'package:untitled3/data/source/remote/service/api_service.dart';

class ApiServiceImpl extends ApiService {
  final _dio = Dio(BaseOptions(
      baseUrl: "https://cbu.uz/uz/",
      receiveDataWhenStatusError: true,
      contentType: "application/json"));

  @override
  Future<List<CurrencyModel>> getAllCurrency() async {
    try {
      _dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      );
      final response = await _dio.get("arkhiv-kursov-valyut/json");
      return (response.data as List)
          .map((currency) => CurrencyModel.fromJson(currency))
          .toList();
    } on DioException {
      rethrow;
    }

    throw UnimplementedError();
  }

  @override
  Future<List<CurrencyModel>> getDateCurrency(String date) async {
    try {
      _dio.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      );

      final response = await _dio.get("arkhiv-kursov-valyut/json/all/$date");
      print("local date api $date");
      return (response.data as List)
          .map((currency) => CurrencyModel.fromJson(currency))
          .toList();
    } on DioException {
      rethrow;
    }
    throw UnimplementedError();
  }
}
