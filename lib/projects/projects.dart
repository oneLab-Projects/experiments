import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/projects/avatar/main.dart';

import 'video_player/main.dart';

List<Project> getProjects() {
  return [
    VideoPlayerProject(),
    AvatarProject(),
  ];
}
