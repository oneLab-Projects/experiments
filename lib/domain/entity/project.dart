import 'package:flutter/widgets.dart' show Widget;

enum ProjectType { widget, full, app }
enum DevelopmentStatus { none, dev, beta, stable }

class InitialSize {
  final double width;
  final double height;
  InitialSize(this.width, this.height);

  String toString() => "{width: $width, height: $height}";
}

abstract class Project {
  int id;
  String name;
  String description;
  ProjectType type;
  DevelopmentStatus developmentStatus;
  Widget source;
  InitialSize initialSize;
}
