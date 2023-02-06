import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/widgets/bottom_navigation_bar_widget.dart';
import 'package:qr_scanner/widgets/floating_action_button_widget.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: bottomNavigationBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Stack(
          children: [
            buildQrView(),
            buildControlButtons(),
            buildBottomText(),
          ],
        ),
      ),
    );
  }

  Widget buildQrView() => Expanded(
        flex: 5,
        child: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Theme.of(context).colorScheme.secondary,
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      );

  Widget buildControlButtons() => Positioned(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: FutureBuilder<bool?>(
                        future: controller?.getFlashStatus(),
                        builder: ((context, snapshot) {
                          if (snapshot.data != null) {
                            return Icon(
                              snapshot.data! ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                            );
                          } else {
                            return Container();
                          }
                        })),
                  ),
                  IconButton(
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    icon: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: ((context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(
                            Icons.switch_camera,
                            color: Colors.white,
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildBottomText() => Positioned(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 150,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Text(
              'Scan a code!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
