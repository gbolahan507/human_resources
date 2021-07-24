class Weathers {
  final dynamic max;
  final dynamic min;
  final dynamic current;
  final dynamic zone;
  final dynamic description;
  final dynamic wind;
  final dynamic day;
  final dynamic humidity;
  final dynamic chanceRain;
  final dynamic image;
  final dynamic time;
  final dynamic location;
  final dynamic uv;


   

  Weathers(
      {this.max,
      this.min,
      this.zone,
      this.description,
      this.wind,
      this.day,
      this.humidity,
      this.chanceRain,
      this.image,
      this.current,
      this.time,
      this.uv,
      this.location});

    double get getTemp => current-273.0;
    double get getminTemp => min-273.0;
    double get getmaxTemp => max-273.0;


}