import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import chronology
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/providers/theme.dart';
//import palette
import 'package:myqr/palette.dart';
import 'package:myqr/screens/chronqr.dart';
import 'package:myqr/screens/scanqr.dart';
import 'package:myqr/screens/creaqr.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    List<Widget> _widgetOptions = <Widget>[
      ScanQR(
        (() {
          setState(() {
            _selectedIndex = 2;
          });
        }),
      ),
      CreateQR(),
      ChronQR(),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: AppBar(
        title: const Center(child: Text('MY QR')),
        leading: IconButton(
          icon: Icon(theme.light ? Icons.light_mode : Icons.dark_mode),
          onPressed: (){
            theme.toggleTheme();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                showLicensePage(context: context);
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
            color: theme.light ? backgroundColor : darkBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: GNav(
              activeColor: theme.light ? primaryColor : lightColor,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              // tabActiveBorder: Border.all(color: primaryColor, style: BorderStyle.solid, width: 1),
              tabBackgroundColor: theme.light ? primaryColor.withOpacity(.2) : lightColor.withOpacity(.2),
              backgroundColor: theme.light ? backgroundColor : darkBackgroundColor,
              selectedIndex: _selectedIndex,
              onTabChange: (index) => setState(() {
                _selectedIndex = index;
                // _pageController.animateToPage(index,duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
              tabs: const [
                GButton(
                  icon: Icons.photo_camera,
                  text: 'Scan QR',
                  // activeColor: primaryColor,
                ),
                GButton(
                  icon: Icons.qr_code,
                  text: 'Crea QR',
                  // activeColor: primaryColor,
                ),
                GButton(
                  icon: Icons.history,
                  text: 'Cronologia',
                  // activeColor: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*

 */