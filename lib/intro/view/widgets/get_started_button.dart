import 'package:flutter/material.dart';

/// {@template get_started_button}
/// A gradient pill button used on the intro screen.
///
/// Wrap with a [SizedBox] to control the width.
/// {@endtemplate}
class GetStartedButton extends StatelessWidget {
  /// {@macro get_started_button}
  const GetStartedButton({
    required this.onPressed,
    this.label = 'Get started',
    super.key,
  });

  /// Called when the button is tapped.
  final VoidCallback? onPressed;

  /// Button label text. Defaults to `'Get started'`.
  final String label;

  static const _gradient = LinearGradient(
    colors: [Color(0xFF6B5CE7), Color(0xFFB5A8F0)],
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: _gradient,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          onTap: onPressed,
          child: SizedBox(
            height: 56,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
