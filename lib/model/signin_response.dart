// To parse this JSON data, do
//
//     final signInResponseModel = signInResponseModelFromJson(jsonString);

import 'dart:convert';

SignInResponseModel signInResponseModelFromJson(String str) =>
    SignInResponseModel.fromJson(json.decode(str));

String signInResponseModelToJson(SignInResponseModel data) =>
    json.encode(data.toJson());

class SignInResponseModel {
  SignInResponseModel({
    this.staus,
    this.message,
    this.data,
  });

  String? staus;
  String? message;
  String? data;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        staus: json["staus"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "staus": staus,
        "message": message,
        "data": data,
      };
}
