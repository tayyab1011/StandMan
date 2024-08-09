import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standman/bottom_sheets/job_completed_sheet.dart';
import 'package:standman/global_variables/base_urls.dart';
import 'package:standman/global_variables/global_variables.dart';
import 'package:standman/helper/custom_toast.dart';
import 'package:standman/main.dart';
import 'package:standman/models/job_create_model.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController jobDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController specialController = TextEditingController();
  bool _isLoading = false;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  JobCreate jobCreate = JobCreate();

  

  Future<void> selectedImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2040));
    if (selectedDate != null) {
      Future.microtask(() {
        setState(() {
          jobDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
        });
      });
    }
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null) {
      Future.microtask(() {
        setState(() {
          startDateController.text = selectedTime.format(context);
        });
      });
    }
  }
  

  Future<void> endTime(BuildContext context) async {
    TimeOfDay? selectedEndTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selectedEndTime != null) {
      Future.microtask(() {
        setState(() {
          endDateController.text = selectedEndTime.format(context);
        });
      });
    }
  }

  void _handleDateSelection() {
    selectDate(context);
  }

  void _handleTimeSelection() {
    selectTime(context);
  }

  void _handleEndTimeSelection() {
    endTime(context);
  }

  jobCreated() async {
   
    var url = Uri.parse('${baseImageURL}api/createJob');
    prefs = await SharedPreferences.getInstance();
    var id = prefs!.getString('id');
    print("id meri ha :$id");

    var request = http.MultipartRequest('POST', url);
    request.fields["users_customers_id"] = id.toString();
    request.fields["name"] = nameController.text;
    request.fields["job_date"] = jobDateController.text;
    request.fields["start_time"] = startDateController.text;
    request.fields["end_time"] = endDateController.text;
    request.fields["special_instructions"] = specialController.text;

    if (_image != null) {
      request.files
          .add(await http.MultipartFile.fromPath("image", _image!.path));
    }

    print('Request Fields: ${request.fields}');
    print('Request Files: ${request.files}');

    var res = await request.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      jobCreate = jobCreateFromJson(resBody);
      print('job ka data${jobCreate.data![0]}');
      if(jobCreate.data != null){
        prefs = await SharedPreferences.getInstance();
      prefs!.setString('job_date', jobCreate.data![0].jobDate.toString());
      prefs!.setString('name', jobCreate.data![0].name.toString());
      prefs!.setString('image', jobCreate.data![0].image.toString());
      }
      var job_date = prefs!.getString('job_date');
    // ignore: unnecessary_brace_in_string_interps
    print("Job ki date ha:${job_date}");
      
      print(resBody);
    } else {
      jobCreate = jobCreateFromJson(resBody);
      print(res.reasonPhrase);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Job Details',
          style: GoogleFonts.outfit(
              textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17),
                    child: SvgPicture.asset('assets/images/locate.svg'),
                  ),
                  Flexible(
                    child: Text(
                      'No 15 uti street off ovie palace road effurun delta state',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17),
              child: _image != null
                  ? Container(
                      height: 145,
                      width: 330,
                      decoration: BoxDecoration(
                           borderRadius: const BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: FileImage(_image!))),
                    )
                  : Container(
                      height: 145,
                      width: 330,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFFF3F3F3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: selectedImage,
                              child: SvgPicture.asset(
                                  'assets/images/image_selector.svg')),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Upload Image',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Job Name  ';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Name your job post',
                          hintStyle: const TextStyle(
                            color: GlobalVariables.iconColor,
                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Job date",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    TextFormField(
                      controller: jobDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your job date  ';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _handleDateSelection,
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: SvgPicture.asset(
                                "assets/images/calendar.svg",
                              ),
                            ),
                          ),
                          hintText: 'Select date',
                          hintStyle: const TextStyle(
                            color: GlobalVariables.iconColor,
                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Start Time",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    TextFormField(
                      controller: startDateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Starting time  ';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _handleTimeSelection,
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: SvgPicture.asset(
                                "assets/images/calendar.svg",
                              ),
                            ),
                          ),
                          hintText: 'Start Time',
                          hintStyle: const TextStyle(
                            color: GlobalVariables.iconColor,
                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "End Time",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    TextFormField(
                      controller: endDateController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _handleEndTimeSelection,
                            child: Padding(
                              padding: const EdgeInsets.all(11.0),
                              child: SvgPicture.asset(
                                "assets/images/calendar.svg",
                              ),
                            ),
                          ),
                          hintText: 'End time',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: GlobalVariables.iconColor),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "These times are approximate and will be adjusted on the bill based on the registered time when a StandMan starts and when the Customer confirms the job is completed",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.w300)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Special Instructions",
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                    TextFormField(
                      maxLines: 4,
                      controller: specialController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter here...',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: GlobalVariables.iconColor),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.15)))),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
                onTap: () async {
                  if (nameController.text.isNotEmpty &&
                      jobDateController.text.isNotEmpty &&
                      endDateController.text.isNotEmpty) {
                    await jobCreated();
                    if (jobCreate.status == 'success') {
                      showModalBottomSheet(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return const JobCompletedSheet();
                          });
                    } else {
                      CustomToast.showToast(message: 'Job is not created');
                    }
                  } else {
                    CustomToast.showToast(message: 'All fields are required');
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 48,
                  width: 317,
                  decoration: BoxDecoration(
                      color: GlobalVariables.buttonColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Next',
                            style: GoogleFonts.outfit(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
