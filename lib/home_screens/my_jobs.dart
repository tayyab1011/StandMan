import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/tab_bars/my_jobs_tab.dart';
import 'package:standman/tab_bars/on_going_jobs.dart';
import 'package:standman/tab_bars/previous_jobs.dart';

class MyJobs extends StatefulWidget {
  const MyJobs({super.key});

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
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
                    "assets/images/search1.svg",
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
              centerTitle: true,
              title: Text(
                "My Jobs",
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
                decoration:
                    const BoxDecoration(color: GlobalVariables.buttonColor),
              ),
            ),
          ),
          backgroundColor: GlobalVariables.buttonColor,
          body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child:  Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color:Colors.grey.shade50,
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: TabBar(
                
                labelStyle: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                unselectedLabelColor: Colors.grey, // Grey color for unselected tabs
                labelColor: Colors.black, // Black color for selected tab
                indicator: BoxDecoration(
                  color: Colors.white, // Background color of the selected tab
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners for the selected tab
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(66, 99, 93, 93), // Shadow color
                      offset: Offset(0, 1), // Shadow offset
                      blurRadius: 4.0, // Shadow blur radius
                    ),
                  ],
                ),
                tabs: const [
                   Tab(
                    child: Center(child: Text('My Jobs')),
                  ),
                  Tab(
                    child: Center(child: Text('On Going')),
                  ),
                  Tab(
                    child: Center(child: Text('Previous')),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(children: [
              MyJobsTab(),
              OnGoingJobs(),    
              PreviousJobs()
              
            ]),
          )
        ],
      ),
            
          
        
      
              ))
            ],
          ),
        ));
  }
}
