import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/theme.dart';
//import util.dart
import 'package:myqr/utils/util.dart';
import 'package:path/path.dart';
import 'package:myqr/palette.dart';

class ChronologyCard extends StatelessWidget {
  ChronologyCard(this.val, {Key? key}) : super(key: key);
  String val;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.light ? Colors.white : Color.fromARGB(255, 35, 35, 35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Text(val),
            flex: 3,
          ),
          Expanded(
            child: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  urlLauncher(val);
                }),
            flex: 1,
          )
        ],
      ),
    );
  }
}
