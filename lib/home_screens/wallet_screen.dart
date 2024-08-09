import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/dialogs/wallet_added.dart';
import 'package:standman/global_variables/global_variables.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
                  color: Colors.orangeAccent),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment methods',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                ),
                Row(
                  children: [
                    Text(
                      'Add Card',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset('assets/images/add_wallet.svg')
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return WalletAdded();
                  });
            },
            child: SizedBox(
              width: double.infinity,
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/master_frames.png',
                                height: 32,
                                width: 32,
                              ),
                              Text(
                                '...  8127',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: GlobalVariables.buttonColor)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'USD',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey)),
                              ),
                              Text(
                                '29,300.00',
                                style: GoogleFonts.outfit(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: GlobalVariables.buttonColor)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 10,
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
                            return Column(
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
                            );
                            
                          }
                          
                          ),
                          
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
