import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static const String _baseUrl = "https://youtube-media-downloader.p.rapidapi.com";
  static final Dio _dio = Dio();

  Future<dynamic> getData(String endPoint) async {
    final response = await _dio.get(
      "$_baseUrl$endPoint",
      options: Options(
        headers: {'x-rapidapi-key': dotenv.env['APIKEY'], 'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com'},
      ),
    );
    return response.data;
  }
}
