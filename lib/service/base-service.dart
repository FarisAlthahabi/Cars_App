import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  late Response response;
  String BaseCarsUrl =
      'https://65a781da94c2c5762da6d48f.mockapi.io/api/v1/cars';
}
