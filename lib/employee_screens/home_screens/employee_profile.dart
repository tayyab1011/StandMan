import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/employee_tab_bars/info_tab.dart';
import 'package:standman/employee_screens/employee_tab_bars/ratings_tab.dart';
import 'package:standman/employee_screens/home_screens/employee_edit_profile.dart';
import 'package:standman/global_variables/global_variables.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({super.key});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(65),
              child: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/menu.png',
                    height: 24,
                    width: 24,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EmployeeEditProfile()));
                      },
                      child: SvgPicture.asset(
                        "assets/images/edit.svg",
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey.shade50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                        labelStyle: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Colors
                              .white, // Background color of the selected tab
                          borderRadius: BorderRadius.circular(
                              15.0), // Rounded corners for the selected tab
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(
                                  66, 99, 93, 93), // Shadow color
                              offset: Offset(0, 1), // Shadow offset
                              blurRadius: 4.0, // Shadow blur radius
                            ),
                          ],
                        ),
                        tabAlignment: TabAlignment.center,
                        unselectedLabelColor: GlobalVariables.iconColor,
                        labelColor: Colors.black,
                        dividerHeight: 0,
                        tabs: const [
                          Tab(
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Text('Info'),
                            )),
                          ),
                          Tab(
                            child: Center(
                                child: Text('Ratings')),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(children: [InfoTab(), RatingsTab()]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
