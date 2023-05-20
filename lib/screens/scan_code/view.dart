import 'dart:io';

import 'package:easypaisa/screens/main_screen.dart';
import 'package:easypaisa/screens/scan_code/components/test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  bool torchOn = false;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black87,
          size: 15,
        ),
      ),
      toolbarHeight: 70,
      title: const Text(
        'Scan QR To Make Payment',
        style: TextStyle(color: Colors.black87, fontSize: 17),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Help',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        )
      ],
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Container(
          // height: 120,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
          child: Column(
            children: [
              const Text(
                'Scan any Easypaisa, Visa or Mastercard QR code\nto pay or send money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/icon.png',
                    height: 16,
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.grey.shade400,
                  ),
                  Image.asset(
                    'assets/icons/visa.png',
                    height: 60,
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.grey.shade400,
                  ),
                  Image.asset(
                    'assets/icons/master.png',
                    height: 45,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text(
                            'Torch',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Switch(
                            value: torchOn,
                            onChanged: (value) {
                              setState(() {
                                torchOn = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                   const Expanded(child: QRScannerScreen()),
                
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
