part of "weather_bloc.dart";

class WeatherState extends Equatable {
  final Weather? weather;
  const WeatherState({this.weather});

  @override
  List<Object?> get props => [weather];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  const WeatherSuccess(Weather weather) : super(weather: weather);
}

final class WeatherFailure extends WeatherState {}
