import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain_layer/weather_model.dart';
import 'package:weather_app/src/presentaion_layer/widgets/blurry_background.dart';
import 'package:weather_app/src/state_management/cubits/get_weather_cubit/get_weather_cubit.dart';


class WeatherBodyComponent extends StatelessWidget {
  const WeatherBodyComponent({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return BlurryBackground(
      body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.red, size: 30,),
                      Text(weatherModel.cityName, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),

                  const SizedBox(height: 40,),
                  Image.network('https:${weatherModel.image!}', scale: 0.7,),
                  Text('${weatherModel.temp.round().toString()}ْ C', style: const TextStyle(fontSize: 46, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text(BlocProvider.of<GetWeatherCubit>(context).weatherModel.weatherCondition,style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),),
                  const SizedBox(height: 15,),
                  Text('last update at  ${weatherModel.date.hour}:${weatherModel.date.minute}', style: TextStyle(fontSize: 18, color: Colors.grey[300]),),

                  const SizedBox(height: 150,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/max_temp.png', height: 70,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('max temp', style: TextStyle(fontSize: 14, color: Colors.grey[300]),),
                              Text(weatherModel.maxTemp.round().toString(), style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset('assets/icons/min_temp.png', height: 70,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('min temp', style: TextStyle(fontSize: 14, color: Colors.grey[300]),),
                              Text(weatherModel.minTemp.round().toString(), style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
