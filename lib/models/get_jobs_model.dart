// To parse this JSON data, do
//
//     final getJobsModel = getJobsModelFromJson(jsonString);

import 'dart:convert';

GetJobsModel getJobsModelFromJson(String str) => GetJobsModel.fromJson(json.decode(str));

String getJobsModelToJson(GetJobsModel data) => json.encode(data.toJson());

class GetJobsModel {
    int? code;
    String? status;
    List<Datum>? data;

    GetJobsModel({
        this.code,
        this.status,
        this.data,
    });

    factory GetJobsModel.fromJson(Map<String, dynamic> json) => GetJobsModel(
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
    String? usersCustomersId;
    String? name;
    DateTime? jobDate;
    String? startTime;
    String? endTime;
    String? specialInstructions;
    String? image;
    int? v;

    Datum({
        this.id,
        this.usersCustomersId,
        this.name,
        this.jobDate,
        this.startTime,
        this.endTime,
        this.specialInstructions,
        this.image,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        usersCustomersId: json["users_customers_id"],
        name: json["name"],
        jobDate: json["job_date"] == null ? null : DateTime.parse(json["job_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        specialInstructions: json["special_instructions"],
        image: json["image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "users_customers_id": usersCustomersId,
        "name": name,
        "job_date": "${jobDate!.year.toString().padLeft(4, '0')}-${jobDate!.month.toString().padLeft(2, '0')}-${jobDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "special_instructions": specialInstructions,
        "image": image,
        "__v": v,
    };
}
