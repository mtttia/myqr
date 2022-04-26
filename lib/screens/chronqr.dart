import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';

import '../components/ChronologyCard.dart';

class ChronQR extends StatelessWidget {
  const ChronQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Chronology chronology = context.watch<Chronology>();

    List<String> list = chronology.chronology;
    return SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: list.map((e) {
            return Slidable(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ChronologyCard(e),
                ),
                // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  dismissible: DismissiblePane(onDismissed: () {
                    
                    chronology.remove(e);
                  }),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {
                        chronology.remove(e);
                      },
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ));
          }).toList(),
        ));
  }
}
