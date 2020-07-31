import 'package:flutter/widgets.dart';

abstract class Properties {
  Properties copyWith();

  List<Widget> getWidgets(BuildContext context);
}
