import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PansyApp(
      title: 'oneLab Experiments',
      theme: ThemeData(
        accentColor: Colors.blueGrey[900],
      ),
      darkTheme: ThemeData(
        accentColor: Colors.blueGrey[100],
        scaffoldBackgroundColor: Colors.blueGrey[900],
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "oneLab Experiments",
                  style: MediaQuery.of(context).size.width > 700
                      ? Theme.of(context).textTheme.headline3
                      : Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlineButton.icon(
                  label: Text("Explore"),
                  icon: Icon(MdiIcons.openInNew, size: 16),
                  onPressed: () => _showMyDialog(context),
                ),
                OutlineButton.icon(
                  label: Text("Open in GitHub"),
                  icon: Icon(MdiIcons.github, size: 16),
                  onPressed: () async => await launch(
                      "https://github.com/oneLab-Projects/onelab_experiments"),
                ),
              ].separated(SizedBox(width: 11)),
            ),
          ].separated(SizedBox(height: 15)),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Внимание Вы не Имеете Права Пользоваться Репликой'
                    '\n[ошибка доступа] — ошибка доступа'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Блять'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
