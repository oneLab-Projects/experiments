import 'package:onelab_experiments/ui/feature/explorer_page.dart';
import 'package:onelab_experiments/ui/feature/welcome_page.dart';
import 'package:pansy_ui/pansy_ui.dart';

class Routes {
  static const String WELCOME = '/';
  static const String EXPLORER = '/explorer';

  static var aliases = {
    WELCOME: (BuildContext context) => WelcomePage(),
    EXPLORER: (BuildContext context) => ExplorerPage(),
  };
}
