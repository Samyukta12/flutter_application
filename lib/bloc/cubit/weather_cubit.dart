import 'package:bloc/bloc.dart';
import 'package:flutter_application/bloc/cubit/weather_state.dart';
import 'package:flutter_application/data/weather_repos.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeatherState());
  Future<void> fetchRouteData() async {
    emit(LoadingWeatherState());
    try {
      final response = await WeatherRepos();
    } catch (error) {
      emit(ErrorWeatherLoadingState());
    }
  }
}
