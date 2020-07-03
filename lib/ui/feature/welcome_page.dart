import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/component/routes.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:url_launcher/url_launcher.dart';

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
                Text(
                  "oneLab Experiments",
                  textAlign: TextAlign.center,
                  style: MediaQuery.of(context).size.width > 700
                      ? Theme.of(context).textTheme.headline3
                      : Theme.of(context).textTheme.headline4,
                ),
                _buildActions(context),
              ].separated(SizedBox(height: 15)),
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
        RaisedButton.icon(
          label: Text(
            "Explore",
            style: Theme.of(context).accentTextTheme.button,
          ),
          icon: Icon(
            MdiIcons.openInNew,
            size: 16,
            color: Theme.of(context).accentIconTheme.color,
          ),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(Routes.PROJECTS),
        ),
        OutlineButton.icon(
          label: Text("Open in GitHub"),
          icon: Icon(MdiIcons.github, size: 16),
          onPressed: () async =>
              await launch("https://github.com/oneLab-Projects/experiments"),
        ),
      ].separated(SizedBox(width: 10)),
    );
  }
}
