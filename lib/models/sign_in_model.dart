// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    String? status;
    String? token;
    List<Datum>? data;
    String? message;

    SignInModel({
        this.status,
        this.token,
        this.data,
        this.message
    });

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? userCustomerType;
    String? firstName;
    String? lastName;
    int? phone;
    String? email;
    String? password;
    String? confirmPassword;
    String? profile;
    int? v;

    Datum({
        this.id,
        this.userCustomerType,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.password,
        this.confirmPassword,
        this.profile,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userCustomerType: json["user_customer_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        profile: json["profile"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_customer_type": userCustomerType,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "profile": profile,
        "__v": v,
    };
}
