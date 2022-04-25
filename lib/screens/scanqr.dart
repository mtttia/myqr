import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/components/ChronologyCard.dart';
import 'package:myqr/screens/scanner.dart';

class ScanQR extends StatelessWidget {
  ScanQR(this.gotoChron, {Key? key}) : super(key: key);
  void Function() gotoChron;

  @override
  Widget build(BuildContext context) {
    Chronology chronology = Provider.of<Chronology>(context, listen: true);

    Widget fromChronology =
        chronology.isEmpty ? Container() : ChronologyCard(chronology.last);

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: fromChronology,
              ),
              InkWell(
                child: Text("Apri la cronologia"),
                onTap: gotoChron,
              ),
            ],
          ),
          
          Center(
            child: Hero(
              tag: "scan",
              child: Image.asset(
                'assets/images/scan_qr.png',
                height: 200,
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: ElevatedButton(
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
                  child: const Text('SCAN QR CODE')))
        ],
      ),
    );
  }
}
