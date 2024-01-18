import 'package:flutter/material.dart';
import 'package:flutter_application/bloc/cubit/weather_cubit.dart';
import 'package:flutter_application/bloc/cubit/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return CircularProgressIndicator();
            } else if (state is ErrorWeatherLoadingState) {
              return Text('Error loading weather data');
            } else if (state is WeatherResponseState) {
              // Assuming WeatherResponseState has a property 'weatherData'
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ok")
                  // Text('Temperature: ${state.weatherData.main.temp}°C'),
                  // Text('Weather: ${state.weatherData.weather[0].description}'),
                  // Add more widgets to display other weather data as needed
                ],
              );
            } else {
              return Text('Unhandled state: $state');
            }
          },
        ),
      ),
    );
  }
}
