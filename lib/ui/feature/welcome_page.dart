import 'package:flare_flutter/flare_actor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/component/routes.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:onelab_experiments/ui/widget/widgets.dart' as experimental;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(MdiIcons.whiteBalanceSunny),
            onPressed: () => ThemeProvider.of(context).toggleThemeMode(),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 130,
                  height: 130,
                  child: FlareActor(
                    'assets/flare/animated_cube.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: 'Intro',
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'oneLab Experiments',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 25,
                      ),
                ),
                SizedBox(height: 18),
                _buildActions(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        experimental.RaisedButton.icon(
          label: Text(
            'Explore',
          ),
          icon: Icon(
            MdiIcons.openInNew,
            color: Colors.white,
          ),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(Routes.PROJECTS),
        ),
        experimental.IconButton.outline(
          icon: Icon(MdiIcons.github),
          onPressed: () async =>
              await launch('https://github.com/oneLab-Projects/experiments'),
        ),
      ].separated(SizedBox(width: 10)),
    );
  }
}
