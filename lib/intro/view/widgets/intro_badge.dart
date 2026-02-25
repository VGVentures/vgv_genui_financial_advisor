import 'package:flutter/material.dart';

/// {@template intro_badge}
/// The "2026 ✦ Gen UI" pill badge shown on the intro screen.
/// {@endtemplate}
class IntroBadge extends StatelessWidget {
  /// {@macro intro_badge}
  const IntroBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFB5A8F0),
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 12, 10),
            child: Text(
              '2026',
              style: TextStyle(
                color: Color(0xFF1A1040),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 14,
                  color: Color(0xFF5B52D8),
                ),
                SizedBox(width: 4),
                Text(
                  'Gen UI',
                  style: TextStyle(
                    color: Color(0xFF1A1040),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
