// To parse this JSON data, do
//
//     final employeeSignIn = employeeSignInFromJson(jsonString);

import 'dart:convert';

EmployeeSignIn employeeSignInFromJson(String str) => EmployeeSignIn.fromJson(json.decode(str));

String employeeSignInToJson(EmployeeSignIn data) => json.encode(data.toJson());

class EmployeeSignIn {
    int? code;
    String? status;
    List<Datum>? data;

    EmployeeSignIn({
        this.code,
        this.status,
        this.data,
    });

    factory EmployeeSignIn.fromJson(Map<String, dynamic> json) => EmployeeSignIn(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
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
    int? v;

    Datum({
        this.id,
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
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
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
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
        "__v": v,
    };
}
