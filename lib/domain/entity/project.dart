import 'package:flutter/widgets.dart' show Widget;

enum ProjectType { widget, page, app }
enum DevelopmentStatus { none, dev, beta, stable }

abstract class Project {
  int id;
  String name;
  String description;
  ProjectType type;
  DevelopmentStatus developmentStatus;
  Widget source;
}