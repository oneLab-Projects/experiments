import 'package:onelab_experiments/domain/interface/properties.dart';
import 'package:flutter/widgets.dart';

enum ProjectType { widget, full, app }
enum DevelopmentStatus { none, dev, beta, stable }

abstract class Project {
  int id;
  String name;
  String description;
  List<int> contributorIds;
  ProjectType type;
  DevelopmentStatus developmentStatus;
  Widget source;
  Properties properties;
}
