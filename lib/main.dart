import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myqr/providers/chronology.dart';
import 'package:myqr/screens/loading.dart';
import 'package:myqr/palette.dart';
import 'package:myqr/screens/app.dart';

void main() {
  // runApp(const MyApp());
  Provider.debugCheckInvalidValueType = null;

  runApp(MultiProvider(
    providers: [
      Provider<Chronology>(
        create: (_) => Chronology(),
      ),
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => primaryColor),
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.white),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: primaryColor,
        ),
        navigationBarTheme: NavigationBarThemeData(backgroundColor: primaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor, foregroundColor: Colors.white),
      ),
      home: !c.isLoading ? const Loading() : App(),
    );
  }
}

