import 'package:flutter_application/data/model.dart';

abstract class WeatherState {}

class InitWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class ErrorWeatherLoadingState extends WeatherState {}

class WeatherResponseState extends WeatherState {
  final WeatherData weatherData;

  WeatherResponseState(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}

@override
List<Object> get props => [];
