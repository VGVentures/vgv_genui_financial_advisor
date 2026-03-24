import 'package:flutter/material.dart';
import 'package:genui_life_goal_simulator/gen/assets.gen.dart';
import 'package:rive/rive.dart';

/// {@template thinking_animation}
/// A reusable widget that plays the AI thinking Rive animation.
///
/// Used as a loading indicator within the simulator dashboard while
/// the AI is generating content.
/// {@endtemplate}
class ThinkingAnimation extends StatefulWidget {
  /// {@macro thinking_animation}
  const ThinkingAnimation({
    this.size = 200,
    this.alignment = Alignment.center,
    super.key,
  });

  /// The alignment of the animation.
  final Alignment alignment;

  /// The width and height of the animation.
  final double size;

  @override
  State<ThinkingAnimation> createState() => _ThinkingAnimationState();
}

class _ThinkingAnimationState extends State<ThinkingAnimation> {
  FileLoader? _fileLoader;

  @override
  void initState() {
    super.initState();
    try {
      _fileLoader = FileLoader.fromAsset(
        Assets.animations.thinking,
        riveFactory: Factory.flutter,
      );
    } on Object {
      // Rive native library not available (e.g., in tests).
    }
  }

  @override
  void dispose() {
    _fileLoader?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fileLoader = _fileLoader;
    if (fileLoader == null) {
      return SizedBox(
        width: widget.size,
        height: widget.size,
      );
    }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: RiveWidgetBuilder(
        fileLoader: fileLoader,
        builder: (context, state) => switch (state) {
          RiveLoaded(:final controller) => RiveWidget(
            controller: controller,
            alignment: widget.alignment,
          ),
          RiveLoading() => const SizedBox.shrink(),
          RiveFailed() => const SizedBox.shrink(),
        },
      ),
    );
  }
}
