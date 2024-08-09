import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/main.dart';
import 'package:standman/models/get_jobs_model.dart';

class MyJobsTab extends StatefulWidget {
  const MyJobsTab({super.key});

  @override
  State<MyJobsTab> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobsTab> {
  String? name;
  GetJobsModel getJobsModel = GetJobsModel();
  String? profile;

  Future<void> loadData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      profile = prefs!.getString('profile');
      name = prefs!.getString('first_name');
    });
  }

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

  @override
  void initState() {
    super.initState();
    getJobs();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getJobsModel.data != null
              ? Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: getJobsModel.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 1,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    imageUrl:
                                        "$baseImageURL${getJobsModel.data![index].image}",
                                    width: 146,
                                    height: 97,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 87,
                                            child: Text(
                                              getJobsModel.data![index].name
                                                  .toString(),
                                              style: GoogleFonts.outfit(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 47,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/more.svg')
                                        ],
                                      ),
                                      Text(
                                        getJobsModel.data![index].jobDate
                                            .toString(),
                                        style: GoogleFonts.outfit(
                                            textStyle: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Taken By',
                                        style: GoogleFonts.outfit(
                                            textStyle: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.lightBlue)),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          profile != null
                                              ? Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "$baseImageURL${profile.toString()}"),
                                                      ),
                                                      shape: BoxShape.circle),
                                                )
                                              : const Icon(
                                                  Icons.person,
                                                  size:
                                                      50, // Adjust size as needed
                                                ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                name.toString(),
                                                style: GoogleFonts.outfit(
                                                    textStyle: const TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/star.svg'),
                                                  const SizedBox(
                                                    width: 1,
                                                  ),
                                                  Text(
                                                    '4.5',
                                                    style: GoogleFonts.outfit(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .grey)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
