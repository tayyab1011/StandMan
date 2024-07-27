import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set status bar color to transparent
      statusBarIconBrightness: Brightness.light, // Set status bar icon color
    ));
    return  Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading:Image.asset('assets/images/menu.png',height: 24,width: 24,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset("assets/images/notify.svg",height: 24,width: 24,),
            ),
          ],
          centerTitle: true,
          title: Text("Home",style: GoogleFonts.outfit(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize:18,
              fontWeight: FontWeight.w500,
            ),
          ),),
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: GlobalVariables.buttonColor),
          ),
        ),),
        body: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/pfp.png',height: 64,),
              title: Text("Hello...!",style: GoogleFonts.outfit(
                textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.w500,color: Colors.white)
              ),),
              subtitle: Text("Marvis Ighedosa",style: GoogleFonts.outfit(
                textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white)
              ),),
            ),
            const SizedBox(height: 20,),
            Expanded(child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 36.0),
                    child: SvgPicture.asset('assets/images/main.svg', ),
                  ),
                  Text("Where you want \nto reserve place..?",style: GoogleFonts.outfit(
                    textStyle: const TextStyle(fontSize: 32,fontWeight: FontWeight.w500,color: Colors.black)
                  ),),
                  const SizedBox(height: 20),
                 GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                
                  child: Container(
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
                              'Create Job',
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
            ))
          ],
        ),
    );
  }
}