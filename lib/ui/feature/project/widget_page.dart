import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:pansy_ui/pansy_ui.dart';

class WidgetPage extends StatelessWidget {
  final Project project;

  const WidgetPage({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue),
    );
  }
}
