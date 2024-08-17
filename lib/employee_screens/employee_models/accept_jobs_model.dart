// To parse this JSON data, do
//
//     final acceptJobs = acceptJobsFromJson(jsonString);

import 'dart:convert';

AcceptJobs acceptJobsFromJson(String str) => AcceptJobs.fromJson(json.decode(str));

String acceptJobsToJson(AcceptJobs data) => json.encode(data.toJson());

class AcceptJobs {
    String? staus;
    int? code;
    Data? data;

    AcceptJobs({
        this.staus,
        this.code,
        this.data,
    });

    factory AcceptJobs.fromJson(Map<String, dynamic> json) => AcceptJobs(
        staus: json["staus"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "staus": staus,
        "code": code,
        "data": data?.toJson(),
    };
}

class Data {
    String? jobsId;
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
