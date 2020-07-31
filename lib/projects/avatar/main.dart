import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:onelab_experiments/domain/entity/project.dart';
import 'package:onelab_experiments/domain/interface/properties.dart';

import 'properties.dart';
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
    url: 'https://identicon-api.herokuapp.com/'
        '${Random().nextInt(1000)}/1024?format=png',
  );

  @override
  Properties properties = AvatarProperties();
}
