import 'package:flutter/material.dart';
import 'package:weather_app/src/presentaion_layer/widgets/blurry_background.dart';


class NoWeatherComponent extends StatelessWidget {
  const NoWeatherComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlurryBackground(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'there is no weather 😞 start searching now 🔍' ,
              style: TextStyle(fontSize: 26, color: Colors.white),
            )
          ],
        )
    );
  }
}
