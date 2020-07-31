import 'package:onelab_experiments/ui/widget/widgets.dart' as experimental;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/domain/interface/properties.dart';
import 'package:onelab_experiments/ui/global/projects/properties_changer.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:provider/provider.dart';

class AvatarProperties extends Properties {
  double width;
  double height;
  String testString;
  int testInt;

  AvatarProperties({
    this.width = 50,
    this.height = 50,
    this.testString = 'Тест текст',
    this.testInt,
  });

  @override
  AvatarProperties copyWith({
    double width,
    double height,
    String testString,
    int testInt,
  }) {
    return AvatarProperties(
      width: width ?? this.width,
      height: height ?? this.height,
      testString: testString ?? this.testString,
      testInt: testInt ?? this.testInt,
    );
  }

  @override
  List<Widget> getWidgets(BuildContext context) {
    var stateManager = Provider.of<PropertiesChanger>(context);
    var state = stateManager.state as AvatarProperties;

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('width: ${state.width}'),
          Row(
            children: [
              experimental.RaisedButton.icon(
                icon: Icon(MdiIcons.minus),
                onPressed: () => stateManager.change(
                  state.copyWith(width: state.width - 5),
                ),
              ),
              experimental.RaisedButton.icon(
                icon: Icon(MdiIcons.plus),
                onPressed: () => stateManager.change(
                  state.copyWith(width: state.width + 5),
                ),
              ),
            ].separated(SizedBox(width: 5)),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('height: ${state.height}'),
          Row(
            children: [
              experimental.RaisedButton.icon(
                icon: Icon(MdiIcons.minus),
                onPressed: () => stateManager.change(
                  state.copyWith(height: state.height - 5),
                ),
              ),
              experimental.RaisedButton.icon(
                icon: Icon(MdiIcons.plus),
                onPressed: () => stateManager.change(
                  state.copyWith(height: state.height + 5),
                ),
              ),
            ].separated(SizedBox(width: 5)),
          )
        ],
      ),
    ].separated(SizedBox(height: 10));
  }
}
