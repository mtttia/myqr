import 'package:flutter/material.dart';
import 'package:myqr/palette.dart';
import 'package:myqr/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';


class OnScanned extends StatelessWidget {
  OnScanned(this.code, {Key? key}) : super(key: key);
  String code;

  @override
  Widget build(BuildContext context) {
    Chronology chronology = context.watch<Chronology>();
    chronology.push(code);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('MY QR'),
        ),
        body: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          margin:const EdgeInsets.only(top: 30),
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      code,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    QrImage(
                      data: code,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ],
                )
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          child: const Text('Apri il link'),
                          onPressed: () {
                            urlLauncher(code);
                          },
                        ),
                        width: double.infinity,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        child: ElevatedButton(
                          child: const Text('CONDIVIDI'),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => accentColor),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                      (states) => Colors.black)),
                          onPressed: () {},
                        ),
                        width: double.infinity,
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
