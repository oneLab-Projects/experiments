import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:vector_math/vector_math_64.dart' as vec;

class MoveView extends StatefulWidget
{
  final Widget child;
  final bool enableTranslate;
  final bool enableZoom;
  final bool enableReverseToRoot;

  const MoveView({
    Key key,
    @required this.child,
    this.enableTranslate = true,
    this.enableZoom = true,
    this.enableReverseToRoot = true,
  }) : super(key: key);

  @override
  _MoveViewState createState() => _MoveViewState();
}

class _MoveViewState extends State<MoveView>
{
  double scaleStart;
  vec.Vector3 transformStart;

  Matrix4 matrix4 = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: this.onScaleStart,
      onScaleUpdate: this.onScaleUpdate,
      child: ClipRRect(
        child: Container(
          color: Colors.transparent,
          child: Transform(
            transform: this.matrix4,
            child: this.widget.child
          )
        )
      )
    );
  }

  vec.Vector3 _vectorFrom(Offset offset) {
    return vec.Vector3(offset.dx, offset.dy, 0);
  }

  void onScaleStart(ScaleStartDetails details) {
    if (this.widget.enableTranslate)
      this.transformStart = _vectorFrom(details.focalPoint);
    if (this.widget.enableZoom)
      this.scaleStart = 1.000;
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    if (this.widget.enableTranslate)
      this.calculateTranslate(details.focalPoint);
    if (this.widget.enableZoom && details.scale != 1) 
      this.calculateScale(details.scale);
  }

  void calculateTranslate(Offset offset) {
    vec.Vector3 transformCurrent = _vectorFrom(offset);

    setState(() {
      this.matrix4.translate(transformCurrent - this.transformStart);
    });

    this.transformStart = transformCurrent;
  }

  void calculateScale(double scale) {
    
    setState(() {
      this.matrix4.scale(scale - this.scaleStart);
    });

    this.scaleStart = scale;
  }

}