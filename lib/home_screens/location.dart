import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/home_screens/job_details.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController placeController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
      statusBarIconBrightness: Brightness.dark, // Set status bar icon color
    ));
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                SvgPicture.asset('assets/images/location.svg'),
                Positioned(
                  right: -17,
                  top: -12,
                  child: SvgPicture.asset('assets/images/location2.svg'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26))),
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Find Place',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      controller: placeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Place  ';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: SvgPicture.asset(
                              "assets/images/location1.svg",
                            ),
                          ),
                          hintText: 'Find Place',
                          hintStyle: const TextStyle(
                            color: GlobalVariables.iconColor,
                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                       
                      const SizedBox(width: 25,),
                      Text(
                        'Choose on map',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey)),
                      ),
                      
                      SvgPicture.asset('assets/images/gps.svg')
                    ],
                  ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const JobDetails()));
                    },
                    child: Container(
                      height: 48,
                      width: 307,
                      decoration: BoxDecoration(
                          color: GlobalVariables.buttonColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Next',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                      ),
                    ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
