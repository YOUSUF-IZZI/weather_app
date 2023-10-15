import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/domain_layer/weather_model.dart';

class WeatherService
{
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'f4385da64c7b414eae4113518230810';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async
  {
      try
      {
        Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
        WeatherModel weatherModel = WeatherModel.formJson(response.data);
        return weatherModel;
      }
      on DioException catch (e)
      {
        final String errorMessage = e.response?.data['error']['message'] ?? 'Oops there was an error, try later';
        throw Exception(errorMessage);
      }
      // if the Exception was from server side
      catch (e) {
        debugPrint(e.toString());
        throw Exception('Oops there was an error from Server side, try later');
      }

  }
}