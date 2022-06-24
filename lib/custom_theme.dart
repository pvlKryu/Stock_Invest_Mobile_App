import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: const Color.fromARGB(255, 193, 199, 196),
      scaffoldBackgroundColor: const Color.fromARGB(255, 193, 199, 196),
      buttonTheme: ButtonThemeData(
        // 4
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: const Color.fromARGB(255, 12, 151, 237),
      ),
      cardTheme: const CardTheme(
        elevation: 20,
        shadowColor: Colors.blueGrey,
        color: Color.fromARGB(255, 184, 234, 209),
      ),
    );
  }

// don't need now
  // static ThemeData get darkTheme {
  //   return ThemeData(
  //       primaryColor: const Color.fromARGB(255, 44, 45, 45),
  //       scaffoldBackgroundColor: Colors.black,
  //       fontFamily: 'Montserrat',
  //       textTheme: ThemeData.dark().textTheme,
  //       buttonTheme: ButtonThemeData(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
  //         buttonColor: const Color.fromARGB(255, 225, 230, 234),
  //       ));
  // }
}
