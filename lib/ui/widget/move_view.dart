import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:pansy_ui/pansy_ui.dart';
import 'package:vector_math/vector_math_64.dart' as vec;
import 'package:flutter/animation.dart';

class MoveView extends StatefulWidget {
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

class _MoveViewState extends State<MoveView> with SingleTickerProviderStateMixin {
  double scaleStart;
  vec.Vector3 transformStart;

  Matrix4 matrix4 = Matrix4.identity();
  Matrix4 animatedMatrix4 = Matrix4.identity();

  Matrix4Tween animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 250), 
      vsync: this
    );

    this.animation = new Matrix4Tween(begin: this.animatedMatrix4, end: Matrix4.identity());
    animation.animate(controller)
      ..addListener(() {
        setState(() { 
          this.matrix4 = this.animation.evaluate(this.controller);
        }); 
        // NOTE: DEBUG
        print(this.matrix4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: this.onScaleStart,
      onScaleUpdate: this.onScaleUpdate,
      onScaleEnd: this.onScaleEnd,
      child: ClipRRect(
        child: Container(
          color: Colors.transparent,
          transform: this.matrix4,
          child: this.widget.child
        )
      )
    );
  }

  vec.Vector3 _vectorFrom(Offset offset) {
    return vec.Vector3(offset.dx, offset.dy, 0);
  }

  void onScaleStart(ScaleStartDetails details) {
    // NOTE: DEBUG
    print("start");

    this.controller.stop();
    
    if (this.widget.enableTranslate) {
      this.transformStart = _vectorFrom(details.focalPoint);
    }
    if (this.widget.enableZoom)
      this.scaleStart = 1.000;
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    // NOTE: DEBUG
    print("upd");

    if (this.widget.enableTranslate)
      this.calculateTranslate(details.focalPoint);
    if (this.widget.enableZoom && details.scale != 1) 
      this.calculateScale(details.scale);

    // NOTE: DEBUG
    print(this.matrix4);
  }

  void onScaleEnd(ScaleEndDetails details) {
    this.controller.forward(from: 0.0);
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
      this.matrix4.scale(scale / this.scaleStart);
    });

    this.scaleStart = scale;
  }

}