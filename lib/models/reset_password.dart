// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
    String? msg;
    String? status;
    Data? data;
    String? message;

    ResetPasswordModel({
        this.msg,
        this.status,
        this.data,
        this.message
    });

    factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
        msg: json["msg"],
        message: json["message"],
        status: json["status"],
        data:json['data'] !=null ? Data.fromJson(json["data"]):null,
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "message":message,
        "data": data!.toJson(),
    };
}

class Data {
    String id;
    String userCustomerType;
    String firstName;
    String lastName;
    int phone;
    String email;
    String password;
    String confirmPassword;
    String profile;
    int v;

    Data({
        required this.id,
        required this.userCustomerType,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.profile,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
