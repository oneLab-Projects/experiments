import 'package:pansy_ui/pansy_ui.dart';

class AppTheme {
  static ThemeData dayTheme = ThemeData(
    primaryColor: Colors.grey[300],
    buttonColor: Colors.grey[800],
    accentColor: Colors.blueGrey[900],
  );

  static ThemeData nightTheme = ThemeData(
    accentColor: Colors.blueGrey[100],
    primaryColor: Colors.blueGrey[400],
    buttonColor: Colors.blueGrey[400],
    scaffoldBackgroundColor: Colors.blueGrey[900],
    brightness: Brightness.dark,
  );
}
