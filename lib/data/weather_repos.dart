import 'dart:convert';

import 'package:flutter_application/data/model.dart';
import 'package:http/http.dart' as http;

class WeatherRepos {
  Future<Object> getAll() async {
    const url =
        "https://api.openweathermap.org/data/2.5/weather?q=lamjung&appid=ab46cfd8225c260ddb6cb326bf280bee";

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return WeatherData(
            coord: e['coord'],
            weather: e['weather'],
            base: e['base'],
            main: e['main'],
            visibility: e['visibility'],
            wind: e['wind'],
            clouds: e['clouds'],
            dt: e['dt'],
            sys: e['sys'],
            timezone: e['timezone'],
            id: e['id'],
            name: e['name'],
            cod: e['cod']);
      }).toList();
      return result;
    } else
      return {throw "something went wrong"};
  }
}
