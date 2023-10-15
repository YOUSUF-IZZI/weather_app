class WeatherModel
{
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({required this.cityName, required this.date, this.image, required this.temp, required this.maxTemp, required this.minTemp, required this.weatherCondition});

  factory WeatherModel.formJson(jsonData)
  {
    return WeatherModel(
      cityName: jsonData['location']['name'],
      date: DateTime.parse(jsonData['current']['last_updated']),
      temp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: jsonData['forecast']['forecastday'][0]['day']['condition']['text'],
      image: jsonData['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

}