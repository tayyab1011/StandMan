import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/employee_screens/employee_models/get_ongoing.dart';
import 'package:standman/employee_screens/home_screens/employee_job_details.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/main.dart';


class EmployeeOnGoing extends StatefulWidget {
  const EmployeeOnGoing({super.key});

  @override
  State<EmployeeOnGoing> createState() => _EmployeeOnGoingState();
}

class _EmployeeOnGoingState extends State<EmployeeOnGoing> {
  int selectedIndex = 0;
  GetGoingJobsModel getGoingJobsModel =  GetGoingJobsModel();

  //get on going jobs
  getOnGoing() async{
    var headersList = {
 'Accept': '*/*',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'Content-Type': 'application/json' 
};
var url = Uri.parse('${baseImageURL}api/ongoingjobs');
prefs = await SharedPreferences.getInstance();
    var employee_id= prefs!.getString('employee_id');

var body = {
  "users_customers_id": employee_id
};

var req = http.Request('POST', url);
req.headers.addAll(headersList);
req.body = json.encode(body);


var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode == 200) {
  getGoingJobsModel = getGoingJobsModelFromJson(resBody);
  if(mounted){
    setState(() {
      
    });
  }
  print(resBody);
}
else {
  getGoingJobsModel = getGoingJobsModelFromJson(resBody);
  print(res.reasonPhrase);
}
  }
  
  changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOnGoing();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body:getGoingJobsModel.data !=null ? Column(
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
                      child: ListView.builder(
                        itemCount: getGoingJobsModel.data!.length,
                        itemBuilder: (context, index) {
                           var item = getGoingJobsModel.data![getGoingJobsModel.data!.length - 1- index];
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
                                          horizontal: 4),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                 item.name.toString(),
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ),
                                              const SizedBox(
                                                width: 67,
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
                                          Container(
                                            width: 67,
                                            height: 19,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFFDACC),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Center(
                                              child: Text(
                                                'On Going',
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Colors.red)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
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
