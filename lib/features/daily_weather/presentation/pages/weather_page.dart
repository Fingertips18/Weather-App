import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/features/daily_weather/presentation/widgets/blur_background.dart';
import 'package:weather_app/features/daily_weather/presentation/widgets/weather_details.dart';
import 'package:weather_app/features/daily_weather/presentation/bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  final Position position;

  const WeatherPage({
    super.key,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc()..add(GetWeather(position)),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const BlurBackground(),
                SafeArea(
                  child: BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherSuccess) {
                        return WeatherDetails(state: state);
                      } else {
                        return const Center(
                          child: Text(
                            "Something went wrong",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
