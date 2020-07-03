import 'package:pansy_ui/pansy_ui.dart';

class ProjectPage extends StatelessWidget {
  final int id;
  const ProjectPage({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("id: $id"),
    );
  }
}
