import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/home_screens/employee_chat_screen.dart';
import 'package:standman/employee_screens/home_screens/employee_home.dart';
import 'package:standman/employee_screens/home_screens/employee_job_screen.dart';
import 'package:standman/employee_screens/home_screens/employee_wallet_screen.dart';



class EmployeeNavBar extends StatefulWidget {
  const EmployeeNavBar({super.key});

  @override
  State<EmployeeNavBar> createState() => _EmployeeNavBarState();
}

class _EmployeeNavBarState extends State<EmployeeNavBar> {
  late List screens = [];
  int _selectedItem = 0;

  void onTap(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  void initState() {
    
    super.initState();
    screens = [
      const EmployeeHome(),
      const EmployeeChatScreen(),
      const EmployeeWalletScreen(),
      const EmployeeJobScreen(),
      Container(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _selectedItem,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        selectedLabelStyle: GoogleFonts.outfit(
          textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black)
        ),
        unselectedLabelStyle: GoogleFonts.outfit(
          textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.grey)
        ),
        items: [
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/home1.svg'),
        label: "Home",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/message2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/messages1.svg'),
        label: "Messages",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/wlt.svg'),
        activeIcon:  SvgPicture.asset('assets/images/wallet1.svg'),
        label: "Wallet",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/jobs2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/jobs1.svg'),
        label: "My Jobs",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/profile2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/profile1.svg'),
        label: "Profile",
        
        )
      ],),
      body: Container(child: screens[_selectedItem],),
    );
  }
}