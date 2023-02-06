import 'package:flutter/material.dart';
import 'package:qr_scanner/screens/home_screen.dart';
import 'package:qr_scanner/screens/profile_screen.dart';
import 'package:qr_scanner/screens/scan_code_screen.dart';
import 'package:qr_scanner/screens/scan_history_screen.dart';
import 'package:qr_scanner/screens/signin_screen.dart';
import 'package:qr_scanner/screens/signup_screen.dart';
import 'package:qr_scanner/screens/view_scan_result_screen.dart';

class ScreenRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/HomeScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/ScanScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ScanCodeScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/ResultScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ViewScanResultScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/HistoryScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ScanHistoryScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/ProfileScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => ProfileScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/SignInScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignInScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      case "/SignUpScreen":
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignUpScreen(),
          settings: settings,
          transitionsBuilder: (_, opacity, __, child) => FadeTransition(
            opacity: opacity,
            child: child,
          ),
        );
      default:
        return null;
    }
  }
}
