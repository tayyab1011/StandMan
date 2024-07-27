import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/home_screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late List screens = [];
  int _selectedItem = 0;

  void onTap(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      const HomeScreen(),
      Container(child: Center(child: Text('Helloo'),),),
      Container(child: Center(child: Text('Helloo'),),),
      Container(child: Center(child: Text('Helloo'),),),
      Container(child: Center(child: Text('Helloo'),),)
    ];
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/home1.svg'),
        label: "Home",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/home1.svg'),
        label: "Home",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/home1.svg'),
        label: "Home",
        
        ),BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/home2.svg'),
        activeIcon:  SvgPicture.asset('assets/images/home1.svg'),
        label: "Home",
        
        )
      ],),
      body: Container(child: screens[_selectedItem],),
    );
  }
}