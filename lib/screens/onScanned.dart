import 'package:flutter/material.dart';
import 'package:myqr/palette.dart';
import 'package:myqr/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/providers/theme.dart';
import 'package:confetti/confetti.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

class OnScanned extends StatelessWidget {
  OnScanned(this.code, {Key? key}) : super(key: key);
  String code;
  ConfettiController _controllerCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  @override
  void dispose() {
    _controllerCenter.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerCenter.play();
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      _controllerCenter.stop();
      Provider.of<Chronology>(context, listen: false).push(code);
    });
    ThemeProvider theme = context.watch<ThemeProvider>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('MY QR'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(top: 30),
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
                  ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality
                        .explosive, // don't specify a direction, blast randomly
                    shouldLoop:
                        true, // start again as soon as the animation is finished
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple
                    ], // manually specify the colors to be used
                    // createParticlePath: drawStar, // define a custom shape/path.
                  ),
                  QrImage(
                    data: code,
                    version: QrVersions.auto,
                    size: 200.0,
                    foregroundColor: theme.light ? Colors.black : Colors.white,
                  ),
                ],
              )),
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
                          onPressed: () {
                            Share.share(code);
                          },
                        ),
                        width: double.infinity,
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
