import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import chronology
import 'package:myqr/providers/chronology.dart';
//import palette
import 'package:myqr/palette.dart';
import 'package:myqr/screens/chronqr.dart';
import 'package:myqr/screens/scanqr.dart';
import 'package:myqr/screens/creaqr.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    

    List<Widget> _widgetOptions = <Widget>[
      ScanQR(),
      CreateQR(),
      ChronQR(),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(
        title: const Center(child: Text('MY QR')),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
            // color: background,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ], borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1),
            child: BottomNavyBar(
              selectedIndex: _selectedIndex,
              showElevation: false, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
                // _pageController.animateToPage(index,duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.photo_camera),
                  title: Text('Scan QR'),
                  activeColor: primaryColor,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.qr_code),
                  title: Text('Crea QR'),
                  activeColor: primaryColor,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.history),
                  title: Text('Cronologia'),
                  activeColor: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
