import 'package:onelab_experiments/component/routes.dart';
import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:pansy_ui/pansy_ui.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key key,
    @required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(Routes.projectWithId(project.id)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  project.name,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .color
                            .withAlpha(250),
                        fontSize: 16,
                      ),
                ),
              ].separated(SizedBox(height: 3)),
            ),
          ],
        ),
      ),
    );
  }
}
