import 'package:flutter/widgets.dart' show Widget;
import 'package:onelab_experiments/domain/entity/project.dart';

import 'widget.dart';

class AvatarProject implements Project {
  @override
  int id = 2;

  @override
  String name = 'Avatar';

  @override
  String description = 'This is a widget designed to display'
      " the user's avatar, with smooth animation of the image appearance.";

  @override
  List<int> contributorIds = [25152332];

  @override
  ProjectType type = ProjectType.widget;

  @override
  DevelopmentStatus developmentStatus = DevelopmentStatus.dev;

  @override
  Widget source = Avatar(
    url: 'https://avatars0.githubusercontent.com/u/25152332?s=460&v=4',
  );

  @override
  InitialSize initialSize = InitialSize(50, 50);
}
