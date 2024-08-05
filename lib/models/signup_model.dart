// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    int? code;
    String? status;
    Data? data;
    String? message;

    SignUpModel({
         this.code,
         this.status,
         this.data,
         this.message
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        code: json["code"],
        message: json["message"],
        status: json["status"],
        data: json["data"] !=null ? Data.fromJson(json["data"]):null,
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
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
