import 'package:flutter/material.dart';
import 'package:flutter_codeigniter_webmailer/shared/shared.dart';
import 'package:flutter_codeigniter_webmailer/views/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Code Igniter Webmailer',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Style.blue500,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Style.white,
                displayColor: Style.white,
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Style.blue500),
              foregroundColor: MaterialStateProperty.all<Color>(Style.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(16),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Style.grey500),
            floatingLabelStyle: TextStyle(color: Style.blue500),
            hintStyle: TextStyle(color: Style.grey500),
            iconColor: Style.grey500,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Style.grey500),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Style.blue500,
                width: 2,
              ),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Style.black,
            foregroundColor: Style.white,
          ),
          useMaterial3: true,
        ),
        home: const Webmailer(),
      );
}
