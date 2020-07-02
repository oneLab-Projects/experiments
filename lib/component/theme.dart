import 'package:pansy_ui/pansy_ui.dart';

class AppTheme {
  static ThemeData dayTheme = ThemeData(
    primaryColor: Colors.grey[900],
    buttonColor: Colors.grey[900],
    accentColor: Colors.blueGrey[900],
  );

  static ThemeData nightTheme = ThemeData(
    accentColor: Colors.blueGrey[100],
    primaryColor: Colors.grey[50],
    buttonColor: Colors.blueGrey[700],
    scaffoldBackgroundColor: Colors.blueGrey[900],
    brightness: Brightness.dark,
  );
}
