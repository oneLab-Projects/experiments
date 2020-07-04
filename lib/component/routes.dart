import 'package:onelab_experiments/ui/feature/not_found_page.dart';
import 'package:onelab_experiments/ui/feature/project/project_page.dart';
import 'package:onelab_experiments/ui/feature/projects_page.dart';
import 'package:onelab_experiments/ui/feature/welcome_page.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:rest_router/rest_navigator.dart';

class Routes {
  static const String WELCOME = '/';
  static const String PROJECTS = '/projects';
  static const String PROJECT = '/project/:id';

  static String projectWithId(int id) => "/project/$id";

  static final router = Router({
    WELCOME: (BuildContext context, parameters) => WelcomePage(),
    PROJECTS: (BuildContext context, parameters) => ProjectsPage(),
    PROJECT: (BuildContext context, parameters) {
      var id = int.tryParse(parameters['id'].first);

      if (id == null) return ProjectsPage();
      return ProjectPage(id: id);
    },
  },
      onUnknownRouteHandler: (BuildContext context, parameters) =>
          NotFoundPage());
}
