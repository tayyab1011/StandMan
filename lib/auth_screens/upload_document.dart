import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:standman/auth_screens/proof_employee.dart';
import 'package:standman/global_variables/global_variables.dart';

// ignore: must_be_immutable
class UploadDocument extends StatefulWidget {
  File? file;
  String? phone;
  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? confrim_password;
   UploadDocument({super.key,this.file,this.phone,this.email,this.first_name,this.last_name,this.confrim_password,this.password});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  File? _document;
  ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> pickedFile() async{
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null){
      setState(() {
        _document = File(pickedImage.path);
      });
    }
  }
  @override
  void initState() {
    
    super.initState();
    print(widget.file);
    print(widget.email);
    print(widget.first_name);
    print(widget.last_name);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/arrow-left.png',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Upload Document",
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "List of Acceptable Identity Documents",
              style: GoogleFonts.outfit(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Passport",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "PR Card",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Driver’s License",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle_rounded,
                        size: 5,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Photo (ID) Card",
                        style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Text(
                    "Upload",
                    style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                _document !=null?
                Container(
                                    width: 311,
                                    height: 226,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        image: DecorationImage(
                                          
                                            fit: BoxFit.cover,
                                            image: FileImage(_document!))),
                                  ):
                  Container(
                      height: 226,
                      width: 311,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFFF3F3F3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: pickedFile,
                              
                              child: SvgPicture.asset(
                                  'assets/images/image_selector.svg')),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Upload',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    GestureDetector(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProofEmployee(
                       email: widget.email,
                              file: widget.file,
                              document: _document,
                              password: widget.password,
                              confrim_password: widget.confrim_password,
                              first_name: widget.first_name,
                              last_name: widget.last_name,
                              phone:widget.phone,
                    )));
                  },
                  child: Container(
                    height: 54,
                    width: 311,
                    decoration: BoxDecoration(
                        color: GlobalVariables.buttonColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'NEXT',
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
      ),
    );
  }
}
