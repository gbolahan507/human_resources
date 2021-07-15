// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
    ErrorModel({
        this.cod,
        this.message,
    });

    int cod;
    String message;

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        cod: json["cod"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
    };
}
