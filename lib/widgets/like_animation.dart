import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child; // To make LikeAnimation the parent widget
  final bool isAnimating; // If it is animating
  final Duration duration; // How long the like animation should continue
  final VoidCallback? onEnd; // Called to end the like animation
  final bool smallLike; // TO check if the like button was clicked instead of the "Double Tap" on the image

  const LikeAnimation(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 150),
      this.onEnd,
      this.smallLike = false,
      required this.isAnimating})
      : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2));
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smallLike) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(
        const Duration(
          milliseconds: 200,
        ),
      );

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
