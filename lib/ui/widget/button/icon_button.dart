import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as md;

const double _kMinButtonSize = 10;

class IconButton extends StatelessWidget {
  final double iconSize;
  final md.VisualDensity visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Widget icon;
  final Color focusColor;
  final Color hoverColor;
  final Color color;
  final Color splashColor;
  final Color highlightColor;
  final Color disabledColor;
  final bool outline;
  final VoidCallback onPressed;
  final FocusNode focusNode;
  final bool autofocus;
  final String tooltip;
  final BoxConstraints constraints;

  IconButton({
    Key key,
    this.iconSize = 17.0,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    @required this.icon,
    this.focusColor,
    this.hoverColor,
    this.color,
    this.splashColor,
    this.highlightColor,
    this.disabledColor,
    this.outline = false,
    @required this.onPressed,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.constraints,
  })  : assert(iconSize != null),
        assert(padding != null),
        assert(alignment != null),
        assert(autofocus != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = md.Theme.of(context);
    Color currentColor;
    if (onPressed != null) {
      currentColor = color;
    } else {
      currentColor = disabledColor ?? theme.disabledColor;
    }

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
        child: SizedBox(
          height: iconSize,
          width: iconSize,
          child: Align(
            alignment: alignment,
            child: IconTheme.merge(
              data: IconThemeData(
                size: iconSize,
                color: currentColor,
              ),
              child: icon,
            ),
          ),
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

    return Semantics(
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
    );
  }

  factory IconButton.outline({
    Key key,
    double iconSize = 17.0,
    md.VisualDensity visualDensity,
    EdgeInsetsGeometry padding = const EdgeInsets.all(9.5),
    AlignmentGeometry alignment = Alignment.center,
    @required Widget icon,
    Color focusColor,
    Color hoverColor,
    Color color,
    Color splashColor,
    Color highlightColor,
    Color disabledColor,
    VoidCallback onPressed,
    FocusNode focusNode,
    bool autofocus = false,
    String tooltip,
    BoxConstraints constraints,
  }) {
    assert(iconSize != null);
    assert(padding != null);
    assert(alignment != null);
    assert(autofocus != null);
    assert(icon != null);

    return IconButton(
      key: key,
      iconSize: iconSize,
      visualDensity: visualDensity,
      padding: padding,
      alignment: alignment,
      icon: icon,
      focusColor: focusColor,
      hoverColor: hoverColor,
      color: color,
      splashColor: splashColor,
      highlightColor: highlightColor,
      disabledColor: disabledColor,
      outline: true,
      onPressed: onPressed,
      focusNode: focusNode,
      autofocus: autofocus,
      tooltip: tooltip,
      constraints: constraints,
    );
  }
}
