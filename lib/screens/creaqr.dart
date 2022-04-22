import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';

class CreateQR extends StatelessWidget {
  const CreateQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Chronology chronology = context.watch<Chronology>();
    return Container(
      child: ListView(
        children: [
          
        ],
      ),
    );
  }
}