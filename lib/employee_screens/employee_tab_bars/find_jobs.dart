import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/employee_screens/employee_models/accept_jobs_model.dart';
import 'package:standman/employee_screens/home_screens/employee_job_details.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/main.dart';
import 'package:standman/models/get_jobs_model.dart';

class FindJobs extends StatefulWidget {
  const FindJobs({super.key});

  @override
  State<FindJobs> createState() => _FindJobsState();
}

class _FindJobsState extends State<FindJobs> {
  
  int selectedIndex = 0;
  GetJobsModel getJobsModel = GetJobsModel();
  bool _isLoading = false;
  AcceptJobs acceptedJobsModel = AcceptJobs();


  getJobs() async {
    var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
    var url = Uri.parse('${baseImageURL}api/getJobs');
    prefs = await SharedPreferences.getInstance();
    var id = prefs!.getString('id');

    var body = {"users_customers_id": id};

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      getJobsModel = getJobsModelFromJson(resBody);
    

      print(resBody);
      if (mounted) {
        setState(() {});
      }
    } else {
      print(res.reasonPhrase);
    }
  }

  /////////////////////////////////////////////////////////////


acceptJobs(String jobsId) async{
  var headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json' 
};
var url = Uri.parse('${baseImageURL}api/acceptjobs');


prefs = await SharedPreferences.getInstance();
    var employee_id = prefs!.getString('employee_id');

var body = {
  "users_customers_id":employee_id,
  "jobs_id":jobsId
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200 ) {
  acceptedJobsModel = acceptJobsFromJson(resBody);
  print(resBody);
}
else {
  print(res.reasonPhrase);
  acceptedJobsModel = acceptJobsFromJson(resBody);
}
}
 

  changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getJobs();
    
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: getJobsModel.data != null
          ? Column(
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
                            itemCount: getJobsModel.data!.length,
                            itemBuilder: (context, index) {
                              var item = getJobsModel.data![getJobsModel.data!.length - 1- index];
                              
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const EmployeeJobDetails()));
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 140,

                                                    child: Text(
                                                      item.name.toString(),
                                                      style: GoogleFonts.outfit(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black)),
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: GoogleFonts.outfit(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .black)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '\$25.86',
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.blue)),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () async {
                                                      await acceptJobs(item.id.toString());
                                                        if(acceptedJobsModel.staus=='success'){
                                                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AcceptedJobs()));
                                                          CustomToast.showToast(message: 'Job is Accepted');
                                                        }
                                                        else{
                                                         CustomToast.showToast(message: 'Job is  Already Accepted'); 
                                                        }
                                                        
                                                      },
                                                      child: Container(
                                                        height: 33,
                                                        width: 81,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                GlobalVariables
                                                                    .buttonColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                        child: Center(
                                                          child: _isLoading
                                                              ? const CircularProgressIndicator(
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Text(
                                                                  'Accept',
                                                                  style: GoogleFonts.outfit(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white)),
                                                                ),
                                                        ),
                                                      )),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () async {
                                                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRatings()));
                                                      },
                                                      child: Container(
                                                        height: 33,
                                                        width: 81,
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                230, 40, 19),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                        child: Center(
                                                          child: _isLoading
                                                              ? const CircularProgressIndicator(
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Text(
                                                                  'Skip',
                                                                  style: GoogleFonts.outfit(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white)),
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
