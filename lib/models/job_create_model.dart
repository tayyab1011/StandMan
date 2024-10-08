// To parse this JSON data, do
//
//     final jobCreate = jobCreateFromJson(jsonString);

import 'dart:convert';

JobCreate jobCreateFromJson(String str) => JobCreate.fromJson(json.decode(str));

String jobCreateToJson(JobCreate data) => json.encode(data.toJson());

class JobCreate {
    int? code;
    String? status;
    List<Datum>? data;

    JobCreate({
        this.code,
        this.status,
        this.data,
    });

    factory JobCreate.fromJson(Map<String, dynamic> json) => JobCreate(
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
    String? usersCustomersId;
    String? name;
    DateTime? jobDate;
    String? startTime;
    String? endTime;
    String? specialInstructions;
    String? image;
    String? id;
    int? v;

    Datum({
        this.usersCustomersId,
        this.name,
        this.jobDate,
        this.startTime,
        this.endTime,
        this.specialInstructions,
        this.image,
        this.id,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        usersCustomersId: json["users_customers_id"],
        name: json["name"],
        jobDate: json["job_date"] == null ? null : DateTime.parse(json["job_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        specialInstructions: json["special_instructions"],
        image: json["image"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "users_customers_id": usersCustomersId,
        "name": name,
        "job_date": "${jobDate!.year.toString().padLeft(4, '0')}-${jobDate!.month.toString().padLeft(2, '0')}-${jobDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "special_instructions": specialInstructions,
        "image": image,
        "_id": id,
        "__v": v,
    };
}
