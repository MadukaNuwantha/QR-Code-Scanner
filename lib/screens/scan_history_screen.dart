import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/bottom_navigation_bar_widget.dart';
import 'package:qr_scanner/widgets/floating_action_button_widget.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});

  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}

class _ScanHistoryScreenState extends State<ScanHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: bottomNavigationBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
              buildListItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem() => Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 0),
              blurRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset(
            'assets/qr_code.png',
            width: 40,
          ),
          title: Text('Notification'),
          subtitle: Text('data'),
        ),
      );
}
