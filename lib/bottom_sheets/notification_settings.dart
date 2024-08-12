import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Notification Settings',
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            color: Colors.white,
            elevation: 0.2,
            child: ListTile(
                contentPadding: const EdgeInsets.only(left: 10),
                horizontalTitleGap: 23,
                title: Text(
                  'Job Notifications',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                trailing: Switch(
                  activeColor: GlobalVariables.buttonColor,
                  inactiveTrackColor:Colors.black12,
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  value: isSwitched,
                

                  onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },)),
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            color: Colors.white,
            elevation: 0.2,
            child: ListTile(
                contentPadding: const EdgeInsets.only(left: 10),
                horizontalTitleGap: 23,
                title: Text(
                  'Messages Notifications',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                trailing: Switch(
                  activeColor: GlobalVariables.buttonColor,
                  inactiveTrackColor:Colors.black12,
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  value: isSwitched2,
                

                  onChanged: (value) {
                  setState(() {
                    isSwitched2 = value;
                  });
                },)),
          ),
        ),
        const SizedBox(height: 60,),
         Center(
           child: GestureDetector(
                        onTap: () async {
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => OtpScreen()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          height: 54,
                          width: 286,
                          decoration: BoxDecoration(
                              color: GlobalVariables.buttonColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'Save',
                                    style: GoogleFonts.outfit(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                          ),
                        )),
         ),
                 
      ],
    );
  }
}
