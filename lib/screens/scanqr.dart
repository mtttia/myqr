import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/components/ChronologyCard.dart';
import 'package:myqr/screens/scanner.dart';

class ScanQR extends StatelessWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Chronology chronology = context.watch<Chronology>();

    Widget fromChronology = chronology.chronology.isEmpty
        ? Container()
        : ChronologyCard(
            chronology.chronology[chronology.chronology.length - 1]);

    return SafeArea(
      child: Stack(
        children: [
          fromChronology,
          Center(
            child: Image.asset(
            'assets/images/scan_qr.png',
            height: 200,
          ),
          ),
          const SizedBox(
            height: 20,
          ),
          Positioned(
            bottom: 15,
            left: 20,
            right: 20,
            child:  ElevatedButton(
              onPressed: () {
                print('scan qr');
                //push scanner in navigator as Material Page Route
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scanner(),
                  ),
                );

              },
              child: const Text('SCAN QR CODE')
            )
          )
        ],
      ),
    );
  }
}
