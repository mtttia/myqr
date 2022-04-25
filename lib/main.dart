import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/screens/loading.dart';
import 'package:myqr/palette.dart';
import 'package:myqr/screens/app.dart';
import 'package:myqr/providers/theme.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Chronology>(
        create: (_) => Chronology(),
      ),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Chronology c = context.watch<Chronology>();
    ThemeProvider theme = context.watch<ThemeProvider>();
    bool isLight = theme.light;

    return MaterialApp(
      title: 'my qr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: isLight ? Brightness.light : Brightness.dark,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
            hoverColor: primaryColor,
            focusColor: primaryColor,
            floatingLabelStyle: TextStyle(
              color: primaryColor,
            ),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              //borderSide
              borderSide: BorderSide(
                //color
                color: primaryColor,
              ),
            ),
            fillColor: primaryColor),
        scaffoldBackgroundColor: isLight ? backgroundColor : darkBackgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith((states) =>
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => primaryColor),
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ))),
        ),
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
        navigationBarTheme:
            NavigationBarThemeData(backgroundColor: primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor, foregroundColor: Colors.white),
      ),
      home: Loading(),
    );
  }
}
