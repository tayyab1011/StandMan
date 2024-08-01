import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: Image.asset(
              'assets/images/arrow-left.png',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
          
         
          centerTitle: true,
          title: Text(
            "Notification",
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
          
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  
                  return Card(
                    color: Colors.white,
                    elevation: 0.5,
                    child: ListTile(
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
                        'Your job is accepted',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
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
                  );
                  
                }),
          )
          
    
        ],
      ),
      );
  }
}