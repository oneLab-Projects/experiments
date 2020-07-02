import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pansy_ui/pansy_ui.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oneLab Experiments"),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.whiteBalanceSunny),
            onPressed: () => ThemeProvider.of(context).toggleThemeMode(),
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
