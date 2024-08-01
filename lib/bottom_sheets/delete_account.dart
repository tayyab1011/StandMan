import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Change Password',
                  style: GoogleFonts.outfit(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset('assets/images/delete_account.svg'),
         const SizedBox(
          height: 20,
        ),
        Text(
          textAlign: TextAlign.center,
          'Are your sure to \ndelete your account?',
          style: GoogleFonts.outfit(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30,),
         GestureDetector(
                      onTap: () async {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => OtpScreen()));
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
                                  'Yes I Want To delete My Account',
                                  style: GoogleFonts.outfit(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                        ),
                      )),
                      const SizedBox(height: 20,),
                       GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        
                      },
                      child: Container(
                        height: 54,
                        width: 286,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: GlobalVariables.buttonColor
                          ),
                            color:Colors.transparent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'No I Don\'t Want To delete My Account',
                                  style: GoogleFonts.outfit(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: GlobalVariables.buttonColor)),
                                ),
                        ),
                      )),
                      const SizedBox(height: 20,),
      ],
    );
  }
}
