import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/palette.dart';
import 'package:myqr/screens/app.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Chronology c = context.watch<Chronology>();

    if (c.isLoading) {
      return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.fallingDot(
            color: primaryColor,
            size: 200,
          ),
        ),
      );
    } else {
      return App();
    }
  }
}
