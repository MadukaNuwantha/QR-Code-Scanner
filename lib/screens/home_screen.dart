import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/widgets/bottom_navigation_bar_widget.dart';
import 'package:qr_scanner/widgets/floating_action_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> codeGeneratorKey;
  @override
  void initState() {
    codeGeneratorKey = {
      "id": "01",
      "name": "Maduka Nuwantha",
      "email": "mbnuwantha90@gmail.com",
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: bottomNavigationBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Maduka Nuwantha',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Scan the below code!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 30),
              buildQrCode(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQrCode() => Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: QrImage(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(10),
            data: jsonEncode(codeGeneratorKey),
            size: 350,
          ),
        ),
      );
}
