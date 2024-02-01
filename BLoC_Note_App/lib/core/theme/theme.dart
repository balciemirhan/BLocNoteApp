import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  AppTheme._();

  /* ------------- Light Theme ------------- */

  static final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      background: AppColor.lightBg,
      /*  primary: Color.fromARGB(255, 10, 228, 148),
      onBackground: Colors.blue,
      onPrimary: Color.fromARGB(255, 211, 34, 54), */

      /*  onPrimary: Colors.white, */
    ),
  );

  /* ------------- Dark theme ------------- */

  static final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 2, 7, 22),
      /*   primary: Color.fromARGB(255, 255, 0, 0),
      onBackground: Color.fromARGB(255, 222, 255, 6),
      onPrimary: Color.fromARGB(255, 47, 223, 200), */
    ),
  );
}
