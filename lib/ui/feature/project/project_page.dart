import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/projects/projects.dart';
import 'package:onelab_experiments/ui/feature/not_found_page.dart';
import 'package:pansy_ui/pansy_ui.dart';

class ProjectPage extends StatefulWidget {
  final int id;
  const ProjectPage({Key key, this.id}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  Project _project;

  @override
  void initState() {
    super.initState();
    _project = getProjects().firstWhere(
      (element) => element.id == widget.id,
      orElse: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_project == null) return NotFoundPage();

    switch (_project.type) {
      case ProjectType.widget:
        return _buildWidgetView();
      case ProjectType.app:
        return _project.source;
      default:
        return null;
    }
  }

  Widget _buildWidgetView() {
    Widget source = _project.source;

    if (_project.initialSize != null)
      source = SizedBox(
        width: _project.initialSize.width,
        height: _project.initialSize.height,
        child: _project.source,
      );

    return Scaffold(
      body: Column(
        children: [
          Text("id: ${_project.id}, name: ${_project.name},"
              " description: ${_project.description},"
              " type: ${_project.type},"
              " developmentStatus: ${_project.developmentStatus},"
              " source: ${_project.source},"
              " initialSize: ${_project.initialSize}"),
          SizedBox(height: 20),
          source,
        ],
      ),
    );
  }
}
