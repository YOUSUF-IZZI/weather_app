import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/presentaion_layer/components/no_weather_component.dart';
import 'package:weather_app/src/presentaion_layer/components/weather_info_body.dart';
import 'package:weather_app/src/presentaion_layer/pages/search_page.dart';
import 'package:weather_app/src/state_management/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/src/state_management/cubits/get_weather_cubit/get_weather_states.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // To use the area behind the appBar
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // To change wifi and sim color
        /*systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light
        ),*/
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },)
            );
          }, icon: const Icon(Icons.search, color: Colors.white,size: 40,))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherComponent();
        }  else if (state is WeatherLoadedState) {
          return const WeatherBodyComponent();
        }  else {
          return const Text('there was an error');
        }
      },),
    );
  }
}


 