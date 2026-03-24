import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    required this.animationPath,
    required this.onAnimationComplete,
    this.backgroundColor = Colors.black,
    this.backgroundOpacity = 0.5,
    this.animationDuration = const Duration(seconds: 3),
    super.key,
  });

  final String animationPath;
  final VoidCallback onAnimationComplete;
  final Color backgroundColor;
  final double backgroundOpacity;

  /// How long the overlay stays visible before navigating.
  /// Adjust this to match the duration of your Rive animation.
  final Duration animationDuration;

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  FileLoader? _fileLoader;
  Timer? _completionTimer;
  bool _completed = false;

  @override
  void initState() {
    super.initState();

    // Always start a fallback timer so the overlay eventually completes
    // even if the Rive animation fails to load.
    _completionTimer = Timer(widget.animationDuration, _complete);

    try {
      _fileLoader = FileLoader.fromAsset(
        widget.animationPath,
        riveFactory: Factory.flutter,
      );
    } on Object {
      // Rive native library not available — fallback timer will handle it.
    }
  }

  void _complete() {
    if (_completed || !mounted) return;
    _completed = true;
    widget.onAnimationComplete();
  }

  void _onLoaded(RiveLoaded state) {
    state.controller.stateMachine.addEventListener(_onRiveEvent);
  }

  void _onRiveEvent(Event event) {
    if (event case GeneralEvent(name: 'complete' || 'exit' || 'done')) {
      _completionTimer?.cancel();
      _complete();
    }
  }

  @override
  void dispose() {
    _completionTimer?.cancel();
    _fileLoader?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fileLoader = _fileLoader;

    return ColoredBox(
      color: widget.backgroundColor.withValues(
        alpha: widget.backgroundOpacity,
      ),
      child: Center(
        child: fileLoader == null
            ? const SizedBox.shrink()
            : RiveWidgetBuilder(
                fileLoader: fileLoader,
                onLoaded: _onLoaded,
                builder: (context, state) => switch (state) {
                  RiveLoaded(:final controller) => RiveWidget(
                    controller: controller,
                  ),
                  RiveLoading() => const SizedBox.shrink(),
                  RiveFailed() => const SizedBox.shrink(),
                },
              ),
      ),
    );
  }
}
