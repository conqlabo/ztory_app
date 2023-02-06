import 'package:flutter/material.dart';
import 'package:quick_ztory/core/core.dart';

class AnimatedImage extends StatefulWidget {
  final Widget image;
  const AnimatedImage({
    super.key,
    required this.image,
  });

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.image,
        SlideTransition(
          position: _animation,
          child: Image.asset(
            Assets.rocketPersonImage,
          ),
        ),
      ],
    );
  }
}
