// To parse this JSON data, do
//
//     final employeeSignUp = employeeSignUpFromJson(jsonString);

import 'dart:convert';

EmployeeSignUp employeeSignUpFromJson(String str) => EmployeeSignUp.fromJson(json.decode(str));

String employeeSignUpToJson(EmployeeSignUp data) => json.encode(data.toJson());

class EmployeeSignUp {
    int? code;
    String? status;
    Data? data;

    EmployeeSignUp({
        this.code,
        this.status,
        this.data,
    });

    factory EmployeeSignUp.fromJson(Map<String, dynamic> json) => EmployeeSignUp(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    String? usersCustomersType;
    String? firstName;
    String? lastName;
    int? phone;
    String? email;
    String? password;
    String? confirmPassword;
    String? profile;
    String? documentId;
    String? proof;
    String? id;
    int? v;

    Data({
        this.usersCustomersType,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.password,
        this.confirmPassword,
        this.profile,
        this.documentId,
        this.proof,
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        usersCustomersType: json["users_customers_type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        profile: json["profile"],
        documentId: json["documentId"],
        proof: json["proof"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "users_customers_type": usersCustomersType,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "profile": profile,
        "documentId": documentId,
        "proof": proof,
        "_id": id,
        "__v": v,
    };
}
