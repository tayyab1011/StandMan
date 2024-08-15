import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:standman/employee_screens/employee_models/employee_sign_up.dart';
import 'package:standman/employee_screens/home_screens/employee_main_screen.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';

// ignore: must_be_immutable
class ProofEmployee extends StatefulWidget {
  File? file;
  File? document;
  String? phone;
  String? first_name;
  String? last_name;
  String? email;
  String? password;
  String? confrim_password;
  ProofEmployee(
      {super.key,
      this.file,
      this.phone,
      this.email,
      this.first_name,
      this.last_name,
      this.confrim_password,
      this.password,
      this.document});

  @override
  State<ProofEmployee> createState() => _ProofEmployeeState();
}

class _ProofEmployeeState extends State<ProofEmployee> {
  File? proof;
  ImagePicker imagePicker = ImagePicker();
  bool _isLoading = false;
  EmployeeSignUp employeeSignUp = EmployeeSignUp();

  Future<void> pickedFile() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        proof = File(pickedImage.path);
      });
    }
  }

  employeeRegister() async {
  try {
    var url = Uri.parse('${baseImageURL}api/employee_sign_up');
    var request = http.MultipartRequest('POST', url);
    request.fields['users_customers_type'] = "Employee";
    request.fields['first_name'] = widget.first_name.toString();
    request.fields['last_name'] = widget.last_name.toString();
    request.fields['phone'] = widget.phone.toString();
    request.fields['email'] = widget.email.toString();
    request.fields['password'] = widget.password.toString();
    request.fields['confirm_password'] = widget.confrim_password.toString();

    if (widget.file != null && widget.document != null && proof != null) {
      request.files
          .add(await http.MultipartFile.fromPath('profile', widget.file!.path));
      request.files.add(await http.MultipartFile.fromPath('documentId', widget.document!.path));
      request.files.add(await http.MultipartFile.fromPath('proof', proof!.path));
    } else {
      print('One or more files are missing.');
      return;  // Exit the function if any of the files are missing
    }

    print('Request Fields: ${request.fields}');
    print('Request Files: ${request.files}');

    var res = await request.send();
    final resBody = await res.stream.bytesToString();

    print('Response Status Code: ${res.statusCode}');
    print('Response Body: $resBody');

    if (res.statusCode == 200) {
      employeeSignUp = employeeSignUpFromJson(resBody);
      if (mounted) {
        setState(() {});
      }
    } else {
      employeeSignUp = employeeSignUpFromJson(resBody);
    }
  } catch (e) {
    print('Error: $e');
  }
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
            "Proof of Work Eligibility",
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
      body: SingleChildScrollView(
        child: Padding(
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
                          "Birth certificate",
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
                          "Citizenship card",
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
                          "Permanent PR card",
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
                          "Work permit",
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
                        RichText(
                            text: TextSpan(
                                text: "Social Insurance Number ",
                                style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                children: [
                              TextSpan(
                                text: "card or letter",
                                style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ]))
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
                          "Certificate of Indian Status",
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
                          "Canadian Forces Identification Card",
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 47.0),
                          child: Icon(
                            Icons.circle_rounded,
                            size: 5,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Study permit (if it declares the ability to \nwork off-campus unrelated to \nprogram of study)",
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
              const SizedBox(
                height: 30,
              ),
              Text(
                "Please submit a photo or the original document. Scanned copies are not accepted. Make sure to avoid using flash so that your information is clear and readable. If you are uploading a work permit extension letter, upload the extension letter and your work permit in the same photo if you are waiting for your renewed PR card, upload a photo of your current PR card and PR card extension letter",
                style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
              const SizedBox(
                height: 20,
              ),
              proof != null
                  ? Container(
                      width: 311,
                      height: 226,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: FileImage(proof!))),
                    )
                  : Container(
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
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () async {
                    if(widget.email!.isNotEmpty&&widget.first_name!.isNotEmpty&&widget.last_name!.isNotEmpty ){
                      await employeeRegister();
                      if(employeeSignUp.status == 'success'){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EmployeeMainScreen()));
                          CustomToast.showToast(message: 'Employee Registered');
                      }
                      else{
                        CustomToast.showToast(message: 'Not Registered');
                      }
                    }
                     else{
                        CustomToast.showToast(message: 'SomeThing is Missing');
                      }
                   
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
                              'SIGN UP',
                              style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
