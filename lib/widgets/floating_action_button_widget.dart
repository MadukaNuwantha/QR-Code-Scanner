import 'package:flutter/material.dart';

Widget floatingActionButtonWidget(BuildContext context) => Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 8,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(50)),
      child: FloatingActionButton(
        backgroundColor: context.widget.toString() == 'ScanCodeScreen' ? Colors.deepPurpleAccent : Colors.deepPurple.shade700,
        child: Icon(
          Icons.qr_code_scanner,
          size: 28,
          color: Colors.white,
        ),
        onPressed: () {
          // Navigator.pushReplacementNamed(context, '/ScanScreen');
          Navigator.pushNamed(context, '/SignInScreen');
        },
      ),
    );
