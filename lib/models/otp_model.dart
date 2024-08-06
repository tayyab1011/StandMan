// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
    String? message;
    Otp? otp;
    String? status;
    int? code;

    OtpModel({
         this.message,
         this.otp,
         this.status,
         this.code,
    });

    factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"],
        otp:json['otp'] !=null ? Otp.fromJson(json["otp"]):null,
        status: json["status"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "otp": otp!.toJson(),
        "status": status,
        "code": code,
    };
}

class Otp {
    String email;
    String otp;
    String id;
    DateTime createdAt;
    int v;

    Otp({
        required this.email,
        required this.otp,
        required this.id,
        required this.createdAt,
        required this.v,
    });

    factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        email: json["email"],
        otp: json["otp"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
