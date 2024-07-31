import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:standman/global_variables/global_variables.dart';

class AddRatings extends StatefulWidget {
  const AddRatings({super.key});

  @override
  State<AddRatings> createState() => _AddRatingsState();
}

class _AddRatingsState extends State<AddRatings> {
  bool _isLoading = false;
  TextEditingController commentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.buttonColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Image.asset(
            'assets/images/arrow-left.png',
            height: 22,
            width: 22,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                "assets/images/notify.svg",
                height: 24,
                width: 24,
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            "Add Ratings",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
              color: Colors.white),
                        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Eleanor Pena',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    Text(
                      '\$22',
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset('assets/images/locate.svg'),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No 15 uti street off ovie palace road effurun delta state',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                        Text(
                          'Complete job time 03 March - 4:40 PM',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Donec dictum tristique porta. Etiam convallis lorem lobortis nulla molestie, nec tincidunt ex ullamcorper. Quisque ultrices lobortis elit sed euismod. Duis in ultrices dolor, ac rhoncus odio. Suspendisse tempor sollicitudin dui sed lacinia. Nulla quis enim posuere, congue libero quis, commodo purus. Cras iaculis massa ut elit.',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 73,
                    height: 19,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE9FFE7),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.lightGreen)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Give Ratings',
                        style: GoogleFonts.outfit(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ),
                      RatingBar.builder(
                          initialRating: 0,
                          itemSize: 18,
                          itemPadding: EdgeInsets.all(3),
                          minRating: 1,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 2,
                            );
                          },
                          onRatingUpdate: (value) {})
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Add Comments",
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          color: GlobalVariables.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: commentsController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Type here...',
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
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                      onTap: () async {},
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
                                  'Submit',
                                  style: GoogleFonts.outfit(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                ),
                        ),
                      )),
                )
              ],
            ),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
