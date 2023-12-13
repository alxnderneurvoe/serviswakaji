// ignore_for_file: file_names, library_private_types_in_public_api

import '../../../model/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExpandableFab extends StatefulWidget {
  const ExpandableFab(
      {super.key, required this.children, required this.distance});

  final List<Widget> children;
  final double distance;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        vsync: this);

    _expandAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeOutQuad);
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _tapToClose(),
          ..._buildExpandableFabButton(),
          _tapToOpen(),
        ],
      ),
    );
  }

  Widget _tapToClose() {
    return SizedBox(
      height: 55,
      width: 55,
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        child: InkWell(
          onTap: _toggle,
          child: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.close,
              color: darkbrown,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }

  Widget _tapToOpen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      transformAlignment: Alignment.center,
      transform:
          Matrix4.diagonal3Values(_open ? 0.7 : 1.0, _open ? 0.7 : 1.0, 1.0),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _open ? 0.0 : 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: _toggle,
          backgroundColor: Colors.white,
          child: const Icon(
            CupertinoIcons.bars,
            color: darkbrown,
            size: 35,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandableFabButton() {
    final List<Widget> children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);

    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(_ExpandableFab(
          directionDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i]));
    }

    return children;
  }
}

class _ExpandableFab extends StatelessWidget {
  const _ExpandableFab(
      {required this.directionDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child});

  final double directionDegrees;
  final double maxDistance;
  final Animation<double>? progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress!,
      builder: (context, child) {
        final offset = Offset.fromDirection(
            directionDegrees * (math.pi / 180), progress!.value * maxDistance);

        return Positioned(
          right: 2.0 + offset.dx,
          bottom: 2.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress!.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress!,
        child: child,
      ),
    );
  }
}