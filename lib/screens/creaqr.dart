import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/providers/theme.dart';
import 'package:string_validator/string_validator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQR extends StatefulWidget {
  CreateQR({Key? key}) : super(key: key);

  @override
  State<CreateQR> createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
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
            SizedBox(height: 20),
            Center(
              child: QrImage(
                  data: _textController.text,
                  version: QrVersions.auto,
                  size: 200.0,
                  foregroundColor: theme.light ? Colors.black : Colors.white),
            ),
          ],
        ));
  }
}
