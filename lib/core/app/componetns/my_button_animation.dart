import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';

class MyButtonAnimation extends StatefulWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  const MyButtonAnimation(
      {super.key,
      required this.child,
      required this.color,
      this.padding,
      this.borderRadius});

  @override
  State<MyButtonAnimation> createState() => _MyButtonAnimationState();
}

class _MyButtonAnimationState extends State<MyButtonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.0);
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, index) {
          return Container(
            padding: widget.padding ?? const EdgeInsets.all(AppDimesions.px_6),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.primary,
                widget.color,
                AppColors.secondary
              ], stops: [
                0.0,
                controller.value,
                1.0
              ]),
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular(AppDimesions.radius_14),
            ),
            child: widget.child,
          );
        });
  }
}
