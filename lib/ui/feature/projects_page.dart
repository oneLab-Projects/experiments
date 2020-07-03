import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/projects/projects.dart';
import 'package:onelab_experiments/ui/widget/widgets.dart';
import 'package:pansy_ui/pansy_ui.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<Project> projects;

  @override
  void initState() {
    super.initState();
    projects = getProjects();
  }

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
      body: _buildProjects(),
    );
  }

  Widget _buildProjects() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(20),
      children: List.generate(
        projects.length,
        (index) {
          var project = projects[index];
          return ProjectCard(project: project);
        },
      ),
    );
  }
}
