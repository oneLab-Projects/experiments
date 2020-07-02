import 'package:pansy_ui/pansy_ui.dart';

import 'component/routes.dart';
import 'component/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? AppTheme.nightTheme : AppTheme.dayTheme;

    return PansyApp(
      title: 'oneLab Experiments',
      theme: initTheme,
      routes: Routes.aliases,
      initialRoute: Routes.WELCOME,
    );
  }
}
