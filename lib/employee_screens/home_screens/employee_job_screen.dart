import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/employee_tab_bars/accepted_jobs.dart';
import 'package:standman/employee_screens/employee_tab_bars/employee_on_going.dart';
import 'package:standman/employee_screens/employee_tab_bars/find_jobs.dart';
import 'package:standman/global_variables/global_variables.dart';


class EmployeeJobScreen extends StatefulWidget {
  const EmployeeJobScreen({super.key});

  @override
  State<EmployeeJobScreen> createState() => _EmployeeJobScreenState();
}

class _EmployeeJobScreenState extends State<EmployeeJobScreen> {
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
                    child: Center(child: Text('Find Jobs')),
                  ),
                  Tab(
                    child: Center(child: Text('Accepted')),
                  ),
                  Tab(
                    child: Center(child: Text('On Going')),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(children: [
              FindJobs(),
              AcceptedJobs(),
              EmployeeOnGoing()
              
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
