import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class EmployeeChatScreen extends StatefulWidget {
  const EmployeeChatScreen({super.key});

  @override
  State<EmployeeChatScreen> createState() => _EmployeeChatScreenState();
}

class _EmployeeChatScreenState extends State<EmployeeChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Image.asset(
            'assets/images/menu.png',
            height: 24,
            width: 24,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                "assets/images/notify.svg",
                height: 24,
                width: 24,
              ),
            ),
          ],
          
          centerTitle: true,
          title: Text(
            "Chat",
            style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: GlobalVariables.buttonColor),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            horizontalTitleGap: 9,
                            leading: Image.asset(
                              'assets/images/women.png',
                              height: 44,
                              width: 44,
                            ),
                            title: Text(
                              'Marvis Ighedosa',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                            subtitle: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'Hai Rizal, I’m on the way to your home i hope you are there',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ),
                            trailing: Text(
                              '3:45 pm',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.0),
                            child: Divider(
                              height: 0,
                              thickness: 0,
                            ),
                          )
                        ],
                      );
                    })),
          )
        ],
      ),
    );
  }
}
