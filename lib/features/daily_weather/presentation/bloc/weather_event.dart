part of "weather_bloc.dart";

class WeatherEvent extends Equatable {
  final Position? position;
  const WeatherEvent({this.position});

  @override
  List<Object?> get props => [position];
}

class GetWeather extends WeatherEvent {
  const GetWeather(Position position) : super(position: position);
}
