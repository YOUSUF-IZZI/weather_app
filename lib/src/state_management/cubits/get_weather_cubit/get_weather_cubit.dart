import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain_layer/weather_model.dart';
import 'package:weather_app/src/state_management/cubits/get_weather_cubit/get_weather_states.dart';
import '../../../data_layer/services/weather_service.dart';


class GetWeatherCubit extends Cubit<WeatherState>
{
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherModel weatherModel;

  getWeather({required String cityName}) async{
    try {
      weatherModel = await WeatherService().getCurrentWeather(cityName: cityName);
      log(weatherModel.cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailedState());
    }
  }

}