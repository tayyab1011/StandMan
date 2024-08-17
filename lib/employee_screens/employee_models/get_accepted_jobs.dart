// To parse this JSON data, do
//
//     final getAcceptedJobs = getAcceptedJobsFromJson(jsonString);

import 'dart:convert';

GetAcceptedJobs getAcceptedJobsFromJson(String str) => GetAcceptedJobs.fromJson(json.decode(str));

String getAcceptedJobsToJson(GetAcceptedJobs data) => json.encode(data.toJson());

class GetAcceptedJobs {
    int? code;
    String? status;
    List<Datum>? data;

    GetAcceptedJobs({
        this.code,
        this.status,
        this.data,
    });

    factory GetAcceptedJobs.fromJson(Map<String, dynamic> json) => GetAcceptedJobs(
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
