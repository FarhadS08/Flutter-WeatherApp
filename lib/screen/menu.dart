import 'package:flutter/material.dart';
import 'package:weather_app/theme_provider.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Menu extends StatefulWidget {
  Menu({Key? key, this.locationWeather});

  final locationWeather;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {


  var date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  var temperature;
  var condition;
  var timezone;
  var windSpeed;
  var humidity;
  var cloud;
  var pressure;
  var uvi;
  var feels;
  var wind_deg;
  var sun_rise_ts;
  late DateTime sun_rise;
  var sun_set_ts;
  late DateTime sun_set;



  void updateUI(dynamic weatherData){
    temperature = weatherData["current"]["temp"];
    condition = weatherData["current"]["weather"][0]["main"];
    timezone = weatherData["timezone"];
    windSpeed = weatherData["current"]["wind_speed"];
    humidity = weatherData["current"]["humidity"];
    cloud = weatherData["current"]["clouds"];
    pressure = weatherData["current"]["pressure"];
    uvi  = weatherData["current"]["uvi"];
    feels = weatherData["current"]["feels_like"];
    wind_deg = weatherData["current"]["wind_deg"];
    sun_rise_ts = weatherData["current"]["sunrise"];
    sun_rise = DateTime.fromMillisecondsSinceEpoch(sun_rise_ts * 1000);
    sun_set_ts = weatherData["current"]["sunset"];
    sun_set = DateTime.fromMillisecondsSinceEpoch(sun_rise_ts * 1000);

  }

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyThemes.Theme.scaffoldBackgroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyThemes.Theme.scaffoldBackgroundColor,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                '$timezone',
                                style: TextStyle(
                                  color: MyThemes.Theme.primaryColorLight,
                                  fontFamily: 'Unbounded',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  color: MyThemes.Theme.primaryColorDark,
                                  fontFamily: 'Unbounded',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$temperature℃',
                                style: TextStyle(
                                  color: MyThemes.Theme.primaryColorLight,
                                  fontFamily: 'Unbounded',
                                  fontSize: 64.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$condition',
                                style: TextStyle(
                                  color: MyThemes.Theme.primaryColorDark,
                                  fontFamily: 'Unbounded',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: MyThemes.Theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '$windSpeed m/s',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text(
                                          "Wind",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '$humidity %',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text(
                                          "Humidity",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '$cloud %',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text(
                                          "Cloud",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: MyThemes.Theme.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('$pressure',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 48.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text("Pressure",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                    child:Container(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      decoration: BoxDecoration(
                                        color: MyThemes.Theme.cardColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Text('$uvi',
                                            style: TextStyle(
                                              color: MyThemes.Theme.primaryColorLight,
                                              fontFamily: 'Unbounded',
                                              fontSize: 48.0,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                          Text("Pressure",
                                            style: TextStyle(
                                              color: MyThemes.Theme.primaryColorDark,
                                              fontFamily: 'Unbounded',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w100,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(48.0),
                                    decoration: BoxDecoration(
                                      color: MyThemes.Theme.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('$feels',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text("Pressure",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child:Container(
                                    padding: EdgeInsets.all(48.0),
                                    decoration: BoxDecoration(
                                      color: MyThemes.Theme.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('$wind_deg',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text("Pressure",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(48.0),
                                    decoration: BoxDecoration(
                                      color: MyThemes.Theme.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('$sun_rise',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text("Sunrise",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(48.0),
                                    decoration: BoxDecoration(
                                      color: MyThemes.Theme.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text('$sun_set',
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorLight,
                                            fontFamily: 'Unbounded',
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                        Text("Sunset",
                                          style: TextStyle(
                                            color: MyThemes.Theme.primaryColorDark,
                                            fontFamily: 'Unbounded',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


