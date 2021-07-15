import 'package:flutter/material.dart';
import 'package:human_resources/core/api/weather_api.dart';
import 'package:human_resources/core/model/weather_model.dart';
import 'package:human_resources/core/view_model/weather_view_model.dart';
import 'package:human_resources/util/constant/base_view.dart';
import 'package:human_resources/widgets/export.dart';
import 'package:intl/intl.dart';

class WeeklyScreen extends StatefulWidget {
  // int index;

  @override
  _WeeklyScreenState createState() => _WeeklyScreenState();
}

class _WeeklyScreenState extends State<WeeklyScreen> {
  WeatherViewModel model;
  WeatherApi weatherApi;
  Future futureweather;
  WeatherModel weatherModel;
  final now = new DateTime.now();

  DateTime date = DateTime.now();

  getWeatherResponse(WeatherModel weatherModel) async {
    return await weatherApi.getWeather();
  }

  @override
  void initState() {
    model = WeatherViewModel();
    weatherApi = WeatherApi();
    futureweather = getWeatherResponse(weatherModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherViewModel>(
        onModelReady: (WeatherViewModel model) => model.getsevendaysWeather(),
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
                              image: AssetImage('images/darkblu2.jpg'))),
                      child: SafeArea(
                        child: FutureBuilder(
                          future: futureweather,
                          builder: (context, snapshot) {
                            final WeatherModel posts = snapshot.data;
                            return Container(
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
                                                  snapshot.hasData
                                                      ? '${posts.timezone}'
                                                      : 'loading',
                                                  fontSize: 18,
                                                  color: Styles.colorWhite,
                                                ),
                                                verticalSpaceTiny,
                                                CustomText(
                                                  // getco(),
                                                  formatter,
                                                  fontSize: 10,
                                                  color: Styles.colorWhite,
                                                ),
                                                verticalSpaceSmall,
                                                verticalSpaceTiny,
                                                CustomText(
                                                  snapshot.hasData
                                                      ? '${posts.current.weather[0].description}'
                                                      : 'loading',
                                                  fontSize: 12,
                                                  color: Styles.colorWhite,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              'images/rainy.png',
                                              width: 100,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        snapshot.hasData
                                            ? '${posts.current.temp.round()}' +
                                                " \u212A"
                                            : 'loading',
                                        fontSize: 20,
                                        color: Styles.colorWhite,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceSmall
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          ListView.builder(
                            itemCount: 7 ?? 0,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Image.asset(
                                        model.busy
                                            ? 'images/rainy2.png'
                                            : model.dailyModel == null
                                                ? 'images/rainy2.png'
                                                : findIcon(
                                                    '${model.dailyModel[index].weather[0].main}',
                                                    index,
                                                    true),
                                        width: 50,
                                      ),
                                    ),
                                    horizontalSpaceMedium,
                                    Expanded(
                                        flex: 3,
                                        child: CustomText(
                                          days(index),
                                          fontSize: 14,
                                          color: Styles.colorBlack,
                                        )),
                                    horizontalSpaceMedium,
                                    Expanded(
                                      flex: 15,
                                      child: Row(
                                        children: [
                                          CustomText(
                                            model.busy
                                                ? 'loading...'
                                                : model.dailyModel == null
                                                    ? 'Error'
                                                    : '${model.dailyModel[index].temp.max.round() ?? 0}\u00B0',
                                            fontSize: 14,
                                            color: Styles.colorBlack,
                                          ),
                                          CustomText('/'),
                                          CustomText(
                                            model.busy
                                                ? 'loading...'
                                                : model.dailyModel == null
                                                    ? 'Error'
                                                    : '${model.dailyModel[index].temp.min.round() ?? 0}\u00B0',
                                            fontSize: 14,
                                            color: Styles.colorBlack,
                                          ),
                                          horizontalSpaceMedium,
                                          Expanded(
                                            child: Text(
                                              model.busy
                                                  ? 'loading...'
                                                  : model.dailyModel == null
                                                      ? 'Error'
                                                      : '${model.dailyModel[index].weather[0].description}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          verticalSpaceMedium,
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ));
  }

  String findIcon(String name, int index, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "images/cloudcopy.png";
          break;
        case "Rain":
          return "images/rain5.png";
          break;
        case "Drizzle":
          return "images/rainy.png";
          break;
        case "Thunderstorm":
          return "images/rainy1.png";
          break;
        case "Snow":
          return "images/rainy2.png";
          break;
        case "Snow":
          return "images/rainy2.png";
          break;
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
          return "images/rainy.png";
          break;
        case "Thunderstorm":
          return "images/rainy.png";
          break;
        case "Snow":
          return "images/rainy.png";
          break;
        case "Snow":
          return "images/rainy.png";
          break;
        default:
          return "images/rainy.png";
      }
    }
  }

  Widget detailsItem(
      BuildContext context, IconData icon, String title, String subtitle) {
    return Expanded(
      child: Row(
        children: <Widget>[
          // Icon(
          //   icon,
          //   color: Styles.colorPurpleLight,
          // ),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText(
                title,
                fontSize: 10,
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

  String days(int i) {
    return DateFormat('EEE').format(DateTime.now().add(Duration(days: i)));
  }

  String formatter = DateFormat('yMd').format(DateTime.now());
}
