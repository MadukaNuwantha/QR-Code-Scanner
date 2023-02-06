import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/bottom_navigation_bar_widget.dart';
import 'package:qr_scanner/widgets/floating_action_button_widget.dart';

class ViewScanResultScreen extends StatefulWidget {
  const ViewScanResultScreen({super.key});

  @override
  State<ViewScanResultScreen> createState() => _ViewScanResultScreenState();
}

class _ViewScanResultScreenState extends State<ViewScanResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: bottomNavigationBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.deepPurple.shade400,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                padding: EdgeInsets.only(top: 150, left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Scan Results',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    resultInfoView(Icons.person, 'Maduka Nuwantha'),
                    resultInfoView(Icons.mail, 'mbnuwantha90@gmail.com'),
                    resultInfoView(Icons.phone_android, '0775921375'),
                    resultInfoView(Icons.person, 'Maduka Nuwantha'),
                  ],
                ),
              ),
            ),
            buildQrImageView(),
          ],
        ),
      ),
    );
  }

  Widget resultInfoView(IconData icon, String resultValue) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 35,
              ),
              SizedBox(width: 15),
              Text(
                resultValue,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  Widget buildQrImageView() => Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Image.asset(
            'assets/qr_code.png',
            width: 200,
          ),
        ),
      );
}
