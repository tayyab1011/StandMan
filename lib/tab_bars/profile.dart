import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: Image.asset(
            'assets/images/menu.png',
            height: 24,
            width: 24,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17),
            child: Container(
              height: 145,
              width: 330,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: GlobalVariables.buttonColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/women.png',
                    height: 99,
                    width: 99,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marvis Ighedosa',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 48,
                        width: 117,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Chat',
                                  style: GoogleFonts.outfit(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: GlobalVariables.buttonColor)),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                              minRating: 1,
                              initialRating: 1,
                              allowHalfRating: true,
                              itemPadding: EdgeInsets.all(1),
                              itemCount: 5,
                              itemSize: 17,
                              itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (value) {}),
                          Text(
                            '4.5',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    horizontalTitleGap: 3,
                    leading: Image.asset(
                      'assets/images/women.png',
                      height: 64,
                      width: 64,
                    ),
                    title: Text(
                      'Marvis Ighedosa',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          'Donec dictum tristique porta. Etiam convallis lorem lobortis nulla molestie, nec tincidunt ex ullamcorper.',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/star.svg',height: 12,width: 12,),
                            const SizedBox(
                              width: 1,
                            ),
                            Text(
                              '4.5',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
