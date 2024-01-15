import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

part "weather_event.dart";
part "weather_state.dart";

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>(onGetWeather);
  }

  void onGetWeather(GetWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      WeatherFactory wf = WeatherFactory(dotenv.env["WEATHER_API_KEY"]!, language: Language.ENGLISH);
      Weather weather = await wf.currentWeatherByLocation(event.position!.latitude, event.position!.longitude);
      emit(WeatherLoading());
      emit(WeatherSuccess(weather));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
