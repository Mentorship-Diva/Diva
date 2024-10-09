import 'package:flutter/material.dart';

class DivaLoadingIndicator extends StatefulWidget {
  const DivaLoadingIndicator({Key? key}) : super(key: key);

  @override
  _DivaLoadingIndicatorState createState() => _DivaLoadingIndicatorState();
}

class _DivaLoadingIndicatorState extends State<DivaLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the speed of rotation
    )..repeat(); // Repeat the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle:
                _controller.value * 2 * 3.1416, // Full rotation (360 degrees)
            child: child,
          );
        },
        child: Image.asset(
          'assets/images/launcher_icon.png',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
