import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
              'assets/images/menu.png',
              height: 24,
              width: 24,
              color: Colors.black,
            ),
          ),
         
          centerTitle: true,
          title: Text(
            "Terms and Conditions",
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
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Text(
                  'Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '- Customer books for less than an hour(60min) they still should be changed for (full 1hour-60min).',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.Pellentesque suscipit fringilla libero eu ullamcorper. Cras risus eros, faucibus sit amet augue id, tempus pellentesque eros. In imperdiet tristique tincidunt. Integer lobortis lorem lorem, id accumsan arcu tempor id. Suspendisse vitae accumsan massa. Duis porttitor, mauris et faucibus sollicitudin, tellus sem tristique risus, nec gravida velit diam aliquet enim. Curabitur eleifend ligula quis convallis interdum. Sed vitae condimentum urna, nec suscipit purus.',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Example: Customer books (12:00-13:45) "105min", but actually order is completed at (14:10)-additional "25min", the Customer will be charged for (130min).',
                  style: GoogleFonts.outfit(
                      textStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                ),
                ],
            ),
          ),
        ],
            ),
      )
    );
  }
}