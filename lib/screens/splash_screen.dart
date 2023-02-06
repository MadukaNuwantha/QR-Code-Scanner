import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    performNavigation(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImageView(context),
            SizedBox(height: 20),
            buildTitleView(context),
          ],
        ),
      ),
    );
  }

  Widget buildImageView(BuildContext context) => Center(
        child: Image.asset(
          'assets/qr_logo.png',
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  Widget buildTitleView(BuildContext context) => Text(
        'QR Code Scanner',
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      );

  performNavigation(context) {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/HomeScreen',
          (route) => false,
        );
      },
    );
  }
}
