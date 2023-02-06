import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/code_provider.dart';
import 'package:qr_scanner/providers/user_provider.dart';
import 'package:qr_scanner/routes/screen_routes.dart';
import 'package:qr_scanner/screens/splash_screen.dart';
import 'package:qr_scanner/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CodeProvider()),
      ],
      child: const CodeScanner(),
    ),
  );
}

class CodeScanner extends StatelessWidget {
  const CodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner',
      theme: theme(),
      home: const SplashScreen(),
      onGenerateRoute: ScreenRoutes.generateRoute,
    );
  }
}
