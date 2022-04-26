import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/theme.dart';
import 'package:string_validator/string_validator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:myqr/palette.dart';

class CreateQR extends StatefulWidget {
  CreateQR({Key? key}) : super(key: key);

  @override
  State<CreateQR> createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  final key = GlobalKey();
  File? file;

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final key = GlobalKey();
    ThemeProvider theme = context.watch<ThemeProvider>();
    return SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            Column(
              children: [
                TextField(
              controller: _textController,
              onChanged: (val) {
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Scrivi qui il contenuto del qrcode',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              children: [
                Icon(isURL(_textController.text) ? Icons.check : Icons.close),
                Text(isURL(_textController.text)
                    ? 'URL valido'
                    : 'URL non valido'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
                child: RepaintBoundary(
                    key: key,
                    child: Container(
                      color: theme.light ? backgroundColor : darkBackgroundColor,
                      child: QrImage(
                              data: _textController.text,
                              version: QrVersions.auto,
                              size: 200.0,
                              foregroundColor:
                                  theme.light ? Colors.black : Colors.white),
                    ))),
              ],
            ),
            
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: ElevatedButton(
              child: const Text('CONDIVIDI'),
              onPressed: () async {
                try {
                  RenderRepaintBoundary boundary = key.currentContext!
                      .findRenderObject() as RenderRepaintBoundary;
//captures qr image
                  var image = await boundary.toImage();
                  ByteData? byteData =
                      await image.toByteData(format: ImageByteFormat.png);
                  Uint8List pngBytes = byteData!.buffer.asUint8List();
//app directory for storing images.
                  final appDir = await getApplicationDocumentsDirectory();
//current time
                  var datetime = DateTime.now();
//qr image file creation
                  file = await File(
                          '${appDir.path}/${datetime.millisecondsSinceEpoch}.png')
                      .create();
//appending data
                  await file?.writeAsBytes(pngBytes);
//Shares QR image
                  Share.shareFiles(
                    [file!.path]
                  );
                  
                } catch (e) {
                  print(e.toString());
                }
              },
            ))
          ],
        ));
  }
}
