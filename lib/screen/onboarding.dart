import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../api/api.dart';
import '../networking.dart';
import '../theme_provider.dart';
import 'menu.dart';



class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  late LocationPermission permission;
  late double latitude;
  late double longitude;

  void getLocationData() async {
    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
      Position position = await
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;

      NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&exclude=minutely");

      var weatherData = await networkHelper.getData();

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Menu(locationWeather: weatherData)),
              (Route<dynamic> route) => false);
    }else {
      permission = await Geolocator.requestPermission();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyThemes.Theme.scaffoldBackgroundColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 90.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To\nCartez\nWeather App",
                        style: TextStyle(
                          color: MyThemes.Theme.primaryColor,
                          fontFamily: 'Unbounded',
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        "Get latest weather news from us easily",
                        style: TextStyle(
                          color: MyThemes.Theme.primaryColorLight,
                          fontFamily: 'Unbounded',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Image.asset('/Users/ferhadsuleymanzade/Documents/weather_app/images/Flood-rafiki.png'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getLocationData();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 100.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: MyThemes.Theme.primaryColor,
                      ),
                    ),
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
