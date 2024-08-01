import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class WalletAdded extends StatefulWidget {
  const WalletAdded({super.key});

  @override
  State<WalletAdded> createState() => _WalletAddedState();
}

class _WalletAddedState extends State<WalletAdded> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      title: Column(
        
        children: [
          SvgPicture.asset('assets/images/card_added.svg',width: 227,height: 320,),
         
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 48,
                  width: 307,
                  decoration: BoxDecoration(
                      color: GlobalVariables.buttonColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Go back to Wallet screen',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                  ),
                ),
              )
            ],
          ),
        
      );
    
    
  }
}
