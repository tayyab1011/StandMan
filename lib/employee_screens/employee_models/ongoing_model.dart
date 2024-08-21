// To parse this JSON data, do
//
//     final onGoingJobsModel = onGoingJobsModelFromJson(jsonString);

import 'dart:convert';

OnGoingJobsModel onGoingJobsModelFromJson(String str) => OnGoingJobsModel.fromJson(json.decode(str));

String onGoingJobsModelToJson(OnGoingJobsModel data) => json.encode(data.toJson());

class OnGoingJobsModel {
    int? code;
    String? status;
    Data? data;

    OnGoingJobsModel({
        this.code,
        this.status,
        this.data,
    });

    factory OnGoingJobsModel.fromJson(Map<String, dynamic> json) => OnGoingJobsModel(
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
    String? id;
    int? v;

    Data({
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
        this.id,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
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
        "_id": id,
        "__v": v,
    };
}
