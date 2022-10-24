import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './shared/shared.dart';
import './views/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Webmailer(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Style.blue500,
          useMaterial3: true,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Style.white,
                displayColor: Style.white,
                fontFamily: GoogleFonts.dmSans().fontFamily,
              ),
          appBarTheme: AppBarTheme(
            backgroundColor: Style.black,
            foregroundColor: Style.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Style.blue500),
              foregroundColor: MaterialStateProperty.all<Color>(Style.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(16),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                Theme.of(context).textTheme.button!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: GoogleFonts.dmSans().fontFamily,
                    ),
              ),
            ),
          ),
          // inputDecorationTheme: InputDecorationTheme(
          //   hintStyle: TextStyle(color: Style.grey500),
          //   iconColor: Style.grey500,
          //   labelStyle: TextStyle(color: Style.grey500),
          //   enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Style.grey500),
          //   ),
          //   focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(
          //       color: Style.blue500,
          //       width: 2,
          //     ),
          //   ),
          // ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Style.grey800,
            behavior: SnackBarBehavior.floating,
            contentTextStyle: TextStyle(
              color: Style.white,
              fontFamily: GoogleFonts.dmSans().fontFamily,
            ),
          ),
        ),
        title: 'Flutter Code Igniter Webmailer',
      );
}
