import 'package:flutter/material.dart';
import 'package:myqr/providers/chronology.dart';
//import util.dart
import 'package:myqr/utils/util.dart';
import 'package:path/path.dart';

class ChronologyCard extends StatelessWidget {
  ChronologyCard(this.val, {Key? key}) : super(key: key);
  String val;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
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
