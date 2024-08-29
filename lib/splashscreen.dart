import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:roomfinder/login%20screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPosition = 0; // Variable to track current position of dots

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
    _navigateToHome();
  }

  void _startLoadingAnimation() {
    // Simulate a loading animation by updating the dots indicator position
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _currentPosition = (_currentPosition + 1) % 3;
        });
        _startLoadingAnimation();
      }
    });
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const PhoneLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF64BAAC), // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'images/LOGO 2.png', // Path to your logo image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            // App Title
            const Text(
              'ROOM FINDER',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            const Text(
              'Ultimate Property Finder',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
            // Dots loading indicator
            DotsIndicator(
              dotsCount: 3,
              position: _currentPosition.toDouble(), // Convert to double
              decorator: DotsDecorator(
                color: Colors.white54, // Inactive color
                activeColor: Colors.white, // Active color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
