// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
    int? code;
    String? status;
    Data? data;
    String? message;

    SignInModel({
        this.code,
        this.status,
        this.data,
        this.message
    });

    factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json['data'] !=null? Data.fromJson(json["data"]):null,
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message":message,
        "data": data!.toJson(),
    };
}

class Data {
    String userCustomerType;
    String firstName;
    String lastName;
    int phone;
    String email;
    String password;
    String confirmPassword;
    String profile;
    String id;
    int v;

    Data({
        required this.userCustomerType,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.profile,
        required this.id,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userCustomerType: json["user_customer_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        profile: json["profile"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "user_customer_type": userCustomerType,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "profile": profile,
        "_id": id,
        "__v": v,
    };
}
