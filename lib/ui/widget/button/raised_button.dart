import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as md;

const double _kMinButtonSize = 35;

class RaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onLongPress;
  final ValueChanged<bool> onHighlightChanged;
  final md.ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color splashColor;
  final bool outline;
  final EdgeInsetsGeometry padding;
  final md.VisualDensity visualDensity;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final md.MaterialTapTargetSize materialTapTargetSize;
  final Duration animationDuration;
  final Widget child;
  final String tooltip;
  final BoxConstraints constraints;

  RaisedButton({
    Key key,
    @required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.outline = false,
    this.padding = const EdgeInsets.all(10.0),
    this.visualDensity,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.animationDuration,
    this.child,
    this.tooltip,
    this.constraints,
  })  : assert(padding != null),
        assert(autofocus != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = md.Theme.of(context);
    final effectiveVisualDensity = visualDensity ?? theme.visualDensity;

    final unadjustedConstraints = constraints ??
        const BoxConstraints(
          minWidth: _kMinButtonSize,
          minHeight: _kMinButtonSize,
        );
    final adjustedConstraints =
        effectiveVisualDensity.effectiveConstraints(unadjustedConstraints);

    Widget result = ConstrainedBox(
      constraints: adjustedConstraints,
      child: Padding(
        padding: padding,
        child: md.DefaultTextStyle(
          style: md.Theme.of(context)
              .textTheme
              .button
              .copyWith(color: md.Colors.white),
          child: Center(child: child),
        ),
      ),
    );

    if (outline) {
      result = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: md.Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: result,
      );
    }

    if (tooltip != null) {
      result = md.Tooltip(
        message: tooltip,
        child: result,
      );
    }

    return md.Material(
      color: md.Theme.of(context).buttonColor,
      borderRadius: BorderRadius.circular(5),
      child: Semantics(
        button: true,
        enabled: onPressed != null,
        child: md.InkWell(
          focusNode: focusNode,
          autofocus: autofocus,
          canRequestFocus: onPressed != null,
          onTap: onPressed,
          child: result,
          focusColor: focusColor ?? md.Theme.of(context).focusColor,
          hoverColor: hoverColor ?? md.Theme.of(context).hoverColor,
          highlightColor: highlightColor ?? md.Theme.of(context).highlightColor,
          splashColor: splashColor ?? md.Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  factory RaisedButton.icon({
    Key key,
    double iconSize = 16.0,
    VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    md.ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    bool outline = false,
    EdgeInsetsGeometry padding = const EdgeInsets.all(10.0),
    @required Widget icon,
    md.VisualDensity visualDensity,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    md.MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget label,
    String tooltip,
    BoxConstraints constraints,
  }) {
    assert(iconSize != null);
    assert(icon != null);
    assert(padding != null);
    assert(autofocus != null);

    return RaisedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      textTheme: textTheme,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      color: color,
      disabledColor: disabledColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      outline: outline,
      padding: padding,
      visualDensity: visualDensity,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: materialTapTargetSize,
      animationDuration: animationDuration,
      child: Row(
        children: [
          SizedBox(
            height: iconSize,
            width: iconSize,
            child: IconTheme.merge(
              data: IconThemeData(
                size: iconSize,
              ),
              child: icon,
            ),
          ),
          if (label != null) SizedBox(width: 7),
          if (label != null) label,
        ],
      ),
      tooltip: tooltip,
      constraints: constraints,
    );
  }
}
