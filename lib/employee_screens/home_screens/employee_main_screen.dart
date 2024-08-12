import 'package:flutter/material.dart';
import 'package:standman/employee_screens/home_screens/employee_bottom_nav_bar.dart';

class EmployeeMainScreen extends StatefulWidget {
  const EmployeeMainScreen({super.key});

  @override
  State<EmployeeMainScreen> createState() => _EmployeeMainScreenState();
}

class _EmployeeMainScreenState extends State<EmployeeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmployeeNavBar(),
    );
  }
}