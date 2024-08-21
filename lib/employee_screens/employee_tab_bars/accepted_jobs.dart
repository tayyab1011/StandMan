import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/employee_screens/employee_models/get_accepted_jobs.dart';
import 'package:standman/employee_screens/employee_models/ongoing_model.dart';
import 'package:standman/employee_screens/home_screens/employee_job_details.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/main.dart';

class AcceptedJobs extends StatefulWidget {
  const AcceptedJobs({super.key});

  @override
  State<AcceptedJobs> createState() => _AcceptedJobsState();
}

class _AcceptedJobsState extends State<AcceptedJobs> {
  GetAcceptedJobs getAcceptedJobsModel = GetAcceptedJobs();
  OnGoingJobsModel onGoingJobsModel = OnGoingJobsModel();
  bool _isLoading = false;

//get accepted jobs api
  getAcceptedJobs() async{
    var headersList = {
 'Accept': '*/*',
 'Content-Type': 'application/json' 
};
var url = Uri.parse('${baseImageURL}api/getAcceptedJobs');
prefs = await SharedPreferences.getInstance();
    var employee_id= prefs!.getString('employee_id');
var body = {
  "users_customers_id":employee_id
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200 ) {
  getAcceptedJobsModel = getAcceptedJobsFromJson(resBody);
  print(resBody);
  if(mounted){
    setState(() {
      
    });
  }
}
else {
  getAcceptedJobsModel = getAcceptedJobsFromJson(resBody);
  print(res.reasonPhrase);
}
  }


  //On going jobs Api
  onGoingJobs(String jobsID) async{
    var headersList = {
 'Accept': '*/*',
 'Content-Type': 'application/json' 
};
var url = Uri.parse('${baseImageURL}api/startjobs');
prefs = await SharedPreferences.getInstance();
    var employee_id= prefs!.getString('employee_id');

var body = {
    "jobs_requests_id": "353",
    "jobs_id": jobsID,
    "users_customers_id": employee_id
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200 ) {
  onGoingJobsModel = onGoingJobsModelFromJson(resBody);
  if(mounted){
    setState(() {
      
    });
  }
  print(resBody);
}
else {
  onGoingJobsModel = onGoingJobsModelFromJson(resBody);
  print(res.reasonPhrase);
}
  }

  @override
  void initState() {
  
    super.initState();
    getAcceptedJobs();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body:getAcceptedJobsModel.data !=null? Column(
        children: [
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const AllJobDetails()));
                    },
                    child: ListView.builder(
                    itemCount: getAcceptedJobsModel.data!.length,
                      itemBuilder: (context, index) {
                        var item = getAcceptedJobsModel.data![getAcceptedJobsModel.data!.length-1-index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const EmployeeJobDetails()));
                          },
                          child: Card(
                            elevation: 1,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            imageUrl:
                                                "$baseImageURL${item.image}",
                                            width: 146,
                                            height: 97,
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 140,
                                          
                                              child: Text(
                                                item.name.toString(),
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                            
                                            SvgPicture.asset(
                                                'assets/images/more.svg')
                                          ],
                                        ),
                                        Text(
                                         item.jobDate.toString(),
                                          style: GoogleFonts.outfit(
                                              textStyle: const TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey)),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/locate.svg',
                                              height: 12,
                                              width: 12,
                                            ),
                                            SizedBox(
                                              width: 140,
                                              child: Text(
                                                'No 15 uti street off ovie palace road effurun delta state',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$25.86',
                                          style: GoogleFonts.outfit(
                                              textStyle: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue)),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () async {
                                                  await onGoingJobs(item.jobsId.toString());
                                                if(onGoingJobsModel.status == 'success'){
                                                  CustomToast.showToast(message: "Job Is Started");
                                                }
                                                else{
                                                  CustomToast.showToast(message: "Job Is already Started");
                                                }
                                                },
                                                child: Container(
                                                  height: 33,
                                                  width: 81,
                                                  decoration: BoxDecoration(
                                                      color: GlobalVariables
                                                          .buttonColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: _isLoading
                                                        ? const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          )
                                                        : Text(
                                                            'Start',
                                                            style: GoogleFonts.outfit(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            GestureDetector(
                                                onTap: () async {
                                                
                                                },
                                                child: Container(
                                                  height: 33,
                                                  width: 81,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 230, 40, 19),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: _isLoading
                                                        ? const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          )
                                                        : Text(
                                                            'Cancel',
                                                            style: GoogleFonts.outfit(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
            ),
          ))
        ],
      ):const Center(child: CircularProgressIndicator(),),
    );
  }
}
