import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FabButtonWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final ScrollController scrollController;
  final void Function() onPressed;

  const FabButtonWidget(
      {super.key,
      required this.icon,
      required this.label,
      required this.scrollController,
      required this.onPressed});

  @override
  State<FabButtonWidget> createState() =>
      _FabButtonWidgetState();
}

class _FabButtonWidgetState
    extends State<FabButtonWidget> {
  bool _extended = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    bool maxScrollReached = widget.scrollController.position.maxScrollExtent ==
        widget.scrollController.position.pixels;
    bool scrollUp = widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward;

    setState(() => _extended = maxScrollReached || scrollUp);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      extendedIconLabelSpacing: _extended ? 10 : 0,
      extendedPadding:
          _extended ? null : const EdgeInsets.symmetric(horizontal: 16),
      onPressed: widget.onPressed,
      icon: Icon(widget.icon),
      label: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: _extended ? Text(widget.label) : Container(),
      ),
    );
  }
}