import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:standman/auth_screens/sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<String> titles = [
    'Welcome',
    'Discover',
    'Get Started',
  ];

  final List<String> descriptions = [
    'Welcome to our app. We are glad to have you!',
    'Discover new features and functionalities.',
    'Get started with using the app right away.',
  ];

  final List<String> images = [
    'assets/images/on_screen1.svg',
    'assets/images/on_screen2.svg',
    'assets/images/on_screen3.svg',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: titles.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      images[index],
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      titles[index],
                      style: GoogleFonts.outfit(
                          textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      descriptions[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: titles.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(60, 60),
                        backgroundColor: currentIndex == 0
                            ? Colors.grey
                            : const Color(0xFF2B65EC),
                        foregroundColor: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle the Skip button press
                          _pageController.jumpToPage(titles.length - 1);
                        },
                        child: Text(
                          'Skip',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 19)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        currentIndex == 2
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LoginScreen()))
                            : _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(60, 60),
                          shape: const CircleBorder(),
                          backgroundColor: const Color(0xFF2B65EC),
                          foregroundColor: Colors.white),
                      child: const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
