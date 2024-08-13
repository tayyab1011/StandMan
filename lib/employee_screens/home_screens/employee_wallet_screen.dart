import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/employee_screens/bottom_sheets/employee_payment_sheet.dart';

import 'package:standman/global_variables/global_variables.dart';

class EmployeeWalletScreen extends StatefulWidget {
  const EmployeeWalletScreen({super.key});

  @override
  State<EmployeeWalletScreen> createState() => _EmployeeWalletScreenState();
}

class _EmployeeWalletScreenState extends State<EmployeeWalletScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/menu.png',
              height: 24,
              width: 24,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Wallet",
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
          Center(
            child: Container(
              height: 145,
              width: 330,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available to withdraw',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue)),
                            ),
                            Text(
                              '\$4,875.00',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue)),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () async {
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRatings()));
                            },
                            child: Container(
                              height: 48,
                              width: 93,
                              decoration: BoxDecoration(
                                  color: GlobalVariables.buttonColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Withdraw',
                                        style: GoogleFonts.outfit(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                      ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 145,
              width: 330,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.orangeAccent),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expenses to date',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            Text(
                              '\$4,875.00',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/images/wlt.svg',
                          height: 48,
                          width: 48,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction History',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (context){
                                  return const EmployeePaymentSheet();
                                });
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
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
                                      'Mar 03, 2023',
                                      style: GoogleFonts.outfit(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey)),
                                    ),
                                    trailing: Text(
                                      '\$25.5',
                                      style: GoogleFonts.outfit(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green)),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
