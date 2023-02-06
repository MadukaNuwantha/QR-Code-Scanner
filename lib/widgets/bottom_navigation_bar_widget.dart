import 'package:flutter/material.dart';

Widget bottomNavigationBarWidget(BuildContext context) => BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.widget.toString() == 'HomeScreen' ? Colors.deepPurpleAccent : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.qr_code,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (context.widget.toString() != 'HomeScreen') {
                      Navigator.pushReplacementNamed(context, '/HomeScreen');
                    }
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.widget.toString() == 'HomeScreen' ? Colors.deepPurpleAccent : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/HomeScreen');
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: context.widget.toString() == 'ScanHistoryScreen' ? Colors.deepPurpleAccent : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.history,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/HistoryScreen');
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.widget.toString() == 'ProfileScreen' ? Colors.deepPurpleAccent : null,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/ResultScreen');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
