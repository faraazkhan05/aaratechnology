// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) =>
    SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) =>
    json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    this.staus,
    this.message,
    this.data,
  });

  String? staus;
  String? message;
  Data? data;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        staus: json["staus"] ,
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "staus": staus,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.mno,
    this.ps,
    this.gender,
    this.currentAddress,
    this.pLocaion,
    this.jobType,
    this.qua,
    this.pYear,
    this.cgpa,
    this.aofs,
    this.exp,
    this.resume,
    this.veri,
    this.img,
    this.counter,
    this.status,
    this.token,
    this.googleId,
  });

  String? id;
  String? name;
  String? email;
  String? mno;
  String? ps;
  dynamic gender;
  dynamic currentAddress;
  dynamic pLocaion;
  String? jobType;
  dynamic qua;
  dynamic pYear;
  dynamic cgpa;
  dynamic aofs;
  dynamic exp;
  dynamic resume;
  dynamic veri;
  String? img;
  String? counter;
  String? status;
  dynamic token;
  dynamic googleId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"] as String,
        email: json["email"] as dynamic,
        mno: json["mno"]as dynamic,
        ps: json["ps"]as dynamic,
        gender: json["gender"],
        currentAddress: json["current_address"],
        pLocaion: json["p_locaion"],
        jobType: json["job_type"],
        qua: json["qua"],
        pYear: json["p_year"],
        cgpa: json["cgpa"],
        aofs: json["aofs"],
        exp: json["exp"],
        resume: json["resume"],
        veri: json["veri"],
        img: json["img"],
        counter: json["counter"],
        status: json["status"],
        token: json["token"],
        googleId: json["google_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mno": mno,
        "ps": ps,
        "gender": gender,
        "current_address": currentAddress,
        "p_locaion": pLocaion,
        "job_type": jobType,
        "qua": qua,
        "p_year": pYear,
        "cgpa": cgpa,
        "aofs": aofs,
        "exp": exp,
        "resume": resume,
        "veri": veri,
        "img": img,
        "counter": counter,
        "status": status,
        "token": token,
        "google_id": googleId,
      };
}
