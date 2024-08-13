import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingsTab extends StatefulWidget {
  const RatingsTab({super.key});

  @override
  State<RatingsTab> createState() => _RatingsTabState();
}

class _RatingsTabState extends State<RatingsTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 20,),
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
      ],),
    );
  }
}