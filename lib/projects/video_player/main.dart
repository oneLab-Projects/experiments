import 'package:flutter/widgets.dart' show Widget;
import 'package:onelab_experiments/domain/entity/project.dart';

import 'widget.dart';

class VideoPlayerProject implements Project {
  @override
  int id = 1;

  @override
  String name = "Video Player";

  @override
  String description =
      "This is a simple player for playing videos, with the ability"
      " to control the playback status and track progress.";

  @override
  ProjectType type = ProjectType.widget;

  @override
  DevelopmentStatus developmentStatus = DevelopmentStatus.dev;

  @override
  Widget source = VideoPlayer(
    url:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  );

  @override
  InitialSize initialSize = InitialSize(355, 200);
}
