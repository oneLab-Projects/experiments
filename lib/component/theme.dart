import 'package:pansy_ui/pansy_ui.dart';

class AppTheme {
  static ThemeData dayTheme = ThemeData(
    brightness: Brightness.light,
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.grey[900],
      inactiveTrackColor: Colors.grey[400],
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 2,
      thumbColor: Colors.grey[900],
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
      overlayColor: Colors.black12,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
    ),
    primaryColor: Colors.white,
    canvasColor: Colors.grey[200],
    scaffoldBackgroundColor: Colors.grey[50],
    buttonColor: Colors.grey[800],
    dividerColor: Color(0x10000000),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      disabledColor: Colors.red,
      labelStyle: TextStyle(
        color: Colors.black87,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      padding: EdgeInsets.all(4),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.green,
      selectedColor: Colors.orange,
      shape: StadiumBorder(
          side: BorderSide(
        width: 1,
        color: Colors.black.withAlpha(15),
      )),
    ),
  );

  static ThemeData nightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[850],
    canvasColor: Colors.grey[850],
    scaffoldBackgroundColor: Colors.grey[900],
    buttonColor: Colors.grey[800],
    dividerColor: Color(0x10FFFFFF),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.grey[700],
      inactiveTrackColor: Colors.grey[800],
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 2,
      thumbColor: Colors.grey[700],
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
      overlayColor: Colors.white12,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white.withAlpha(5),
      brightness: Brightness.dark,
      disabledColor: Colors.red,
      labelStyle: TextStyle(
        color: Colors.white70,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      padding: EdgeInsets.all(4),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.green,
      selectedColor: Colors.orange,
      shape: StadiumBorder(
          side: BorderSide(
        width: 1,
        color: Colors.white.withAlpha(15),
      )),
    ),
  );
}
