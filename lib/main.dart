import 'package:pansy_ui/pansy_ui.dart';

import 'component/routes.dart';
import 'component/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PansyApp(
      title: 'oneLab Experiments',
      theme: AppTheme.dayTheme,
      darkTheme: AppTheme.nightTheme,
      initialRoute: Routes.WELCOME,
      onGenerateRoute: Routes.router.generator,
    );
  }
}

