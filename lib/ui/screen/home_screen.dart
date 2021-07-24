import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:human_resources/core/view_model/weather_view_model.dart';
import 'package:human_resources/util/constant/base_view.dart';
import 'package:human_resources/widgets/export.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double temps;

  final now = new DateTime.now();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherViewModel>(
        onModelReady: (WeatherViewModel model) => model.getWeather2(),
        builder: (_, WeatherViewModel model, __) => SafeArea(
              child: Scaffold(
                  body: Column(
                children: [
                  Expanded(
                    child: Container(
                      // height: 200,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/bgimage2.png'))),
                      child: SafeArea(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        CustomIcon(
                                          icon: Icons.menu,
                                          size: 25,
                                          color: Styles.colorWhite,
                                        ),
                                        Spacer(),
                                        CustomIcon(
                                          icon: Icons.search,
                                          size: 25,
                                          color: Styles.colorWhite,
                                        ),
                                      ],
                                    ),
                                    verticalSpaceMedium,
                                    verticalSpaceMedium,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              model.busy
                                                  ? 'loading...'
                                                  : model.weathers == null
                                                      ? 'Error'
                                                      : '${model.weathers.zone}',
                                              fontSize: 18,
                                              color: Styles.colorWhite,
                                            ),
                                            verticalSpaceTiny,
                                            CustomText(
                                              '$formatter',
                                              fontSize: 10,
                                              color: Styles.colorWhite,
                                            ),
                                            verticalSpaceSmall,
                                            verticalSpaceTiny,
                                            CustomText(
                                              model.busy
                                                  ? 'loading...'
                                                  : model.weathers == null
                                                      ? 'Error'
                                                      : '${model.weathers.description}',
                                              fontSize: 12,
                                              color: Styles.colorWhite,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          model.busy
                                              ? 'images/loadingcopy.png'
                                              : model.weathers == null
                                                  ? 'images/errorcopy.png'
                                                  : findIcon(
                                                      '${model.weathers.image}',
                                                      true),
                                          width: 200,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          model.busy
                                              ? 'loading...'
                                              : model.weathers == null
                                                  ? 'Error'
                                                  : '${model.weathers.getTemp.round()}' +
                                                      "\u00B0",
                                          fontSize: 30,
                                          color: Styles.colorWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpaceMedium,
                              verticalSpaceSmall
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            detailsItem(
                              context,
                              'images/tempcopy.png',
                              'Temperature',
                              model.busy
                                  ? 'loading...'
                                  : model.weathers == null
                                      ? 'Error'
                                      : '${model.weathers.getTemp.round()}' +
                                          " \u2103",
                            ),
                            detailsItem(
                              context,
                              'images/humiditycopy.png',
                              'Humidity',
                              model.busy
                                  ? 'loading...'
                                  : model.weathers == null
                                      ? 'Error'
                                      : '${model.weathers.humidity}%',
                            )
                          ],
                        ),
                        verticalSpaceMedium,
                        Row(
                          children: <Widget>[
                            detailsItem(
                                context,
                                'images/windcopy.png',
                                'wind',
                                model.busy
                                    ? 'loading...'
                                    : model.weathers == null
                                        ? 'Error'
                                        : '${model.weathers.wind}km/h'),
                            detailsItem(
                              context,
                              'images/uvcopy.png',
                              'UV index',
                              model.busy
                                  ? 'loading...'
                                  : model.weathers == null
                                      ? 'Error'
                                      : '${model.weathers.uv}',
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ));
  }

  String findIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "images/cloudcopy.png";
          break;
        case "Rain":
          return "images/rain5.png";
          break;
        case "Drizzle":
          return "images/drizzlecopy.png";
          break;
        case "Thunderstorm":
          return "images/thundercopy.png";
          break;
        case "Snow":
          return "images/snowcopy.png";
        default:
          return "images/rainy.png";
      }
    } else {
      switch (name) {
        case "Clouds":
          return "images/cloudcopy.png";
          break;
        case "Rain":
          return "images/rain5.png";
          break;
        case "Drizzle":
          return "images/drizzlecopy.png";
          break;
        case "Thunderstorm":
          return "images/thundercopy.png";
          break;
        case "Snow":
          return "images/snowcopy.png";
          break;
        default:
          return "images/rainy.png";
      }
    }
  }

  String formatter = DateFormat('yMd').format(DateTime.now());

  Widget detailsItem(
      BuildContext context, String icon, String title, String subtitle) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            width: 40,
            color: Styles.colorPurpleLight,
          ),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Styles.colorGrey,
              ),
              Center(
                child: CustomText(
                  subtitle,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Styles.colorBlack,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
