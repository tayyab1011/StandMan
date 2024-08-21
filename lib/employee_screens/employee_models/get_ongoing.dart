// To parse this JSON data, do
//
//     final getGoingJobsModel = getGoingJobsModelFromJson(jsonString);

import 'dart:convert';

GetGoingJobsModel getGoingJobsModelFromJson(String str) => GetGoingJobsModel.fromJson(json.decode(str));

String getGoingJobsModelToJson(GetGoingJobsModel data) => json.encode(data.toJson());

class GetGoingJobsModel {
    int? code;
    String? status;
    List<Datum>? data;

    GetGoingJobsModel({
        this.code,
        this.status,
        this.data,
    });

    factory GetGoingJobsModel.fromJson(Map<String, dynamic> json) => GetGoingJobsModel(
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
    String? jobsId;
    String? jobsRequestsId;
    String? usersCustomersId;
    String? status;
    String? name;
    DateTime? jobDate;
    String? startTime;
    String? endTime;
    String? specialInstructions;
    String? image;
    int? v;

    Datum({
        this.id,
        this.jobsId,
        this.jobsRequestsId,
        this.usersCustomersId,
        this.status,
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
        jobsId: json["jobs_id"],
        jobsRequestsId: json["jobs_requests_id"],
        usersCustomersId: json["users_customers_id"],
        status: json["status"],
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
        "jobs_id": jobsId,
        "jobs_requests_id": jobsRequestsId,
        "users_customers_id": usersCustomersId,
        "status": status,
        "name": name,
        "job_date": "${jobDate!.year.toString().padLeft(4, '0')}-${jobDate!.month.toString().padLeft(2, '0')}-${jobDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "special_instructions": specialInstructions,
        "image": image,
        "__v": v,
    };
}
