

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinoteca_app/common/utils/common_font.dart';
import 'common_text_widget.dart';

class CustomExpansionTile extends StatefulWidget {

  const CustomExpansionTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.controlAffinity,
  }) : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
        expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
        'CrossAxisAlignment.baseline is not supported since the expanded children '
            'are aligned in a column, not a row. Try to use another constant.',
        );


  final Widget? leading;


  final String title;


  final String? subtitle;


  final ValueChanged<bool>? onExpansionChanged;


  final List<Widget> children;


  final Color? backgroundColor;


  final Color? collapsedBackgroundColor;


  final Widget? trailing;

  final bool initiallyExpanded;

  final bool maintainState;


  final EdgeInsetsGeometry? tilePadding;


  final Alignment? expandedAlignment;

  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final EdgeInsetsGeometry? childrenPadding;


  final Color? iconColor;


  final Color? collapsedIconColor;


  final Color? textColor;

  final Color? collapsedTextColor;

  final ListTileControlAffinity? controlAffinity;

  @override
  State<CustomExpansionTile> createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;
  final Duration _kExpand = const Duration(milliseconds: 200);


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  // Platform or null affinity defaults to trailing.
  ListTileControlAffinity _effectiveAffinity(ListTileControlAffinity? affinity) {
    switch (affinity ?? ListTileControlAffinity.trailing) {
      case ListTileControlAffinity.leading:
        return ListTileControlAffinity.leading;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        return ListTileControlAffinity.trailing;
    }
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset("asset/images/home/img_arrow_down.svg",width: 10,height: 10,),
      ),
    );
  }

  Widget? _buildLeadingIcon(BuildContext context) {
    if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.leading) {
      return null;
    }
    return _buildIcon(context);
  }

  Widget? _buildTrailingIcon(BuildContext context) {
    if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.trailing) {
      return null;
    }
    return _buildIcon(context);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    return Container(

      decoration: BoxDecoration(
        color: _backgroundColor.value ?? expansionTileTheme.backgroundColor ?? Colors.transparent,

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left:10.0,right: 10,top: 10,bottom: 10),
            child:  Row(
              children: [
                widget.leading!,
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0),
                  child: CommonTextWidget(msg: widget.title,font: dSansBold,textSize: 18.0,color: Colors.black,),
                )),
                InkWell(onTap:(){
                  _handleTap();
                },child:_buildTrailingIcon(context)!)
              ],
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment
                  ?? expansionTileTheme.expandedAlignment
                  ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = widget.collapsedTextColor
          ?? expansionTileTheme.collapsedTextColor
          ?? theme.textTheme.subtitle1!.color
      ..end = widget.textColor ?? expansionTileTheme.textColor ?? colorScheme.primary;
    _iconColorTween
      ..begin = widget.collapsedIconColor
          ?? expansionTileTheme.collapsedIconColor
          ?? theme.unselectedWidgetColor
      ..end = widget.iconColor ?? expansionTileTheme.iconColor ?? colorScheme.primary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor ?? expansionTileTheme.collapsedBackgroundColor
      ..end = widget.backgroundColor ?? expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left:10,right: 10),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.shade200,
            ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.children,
                   ),
           )
          ],
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}