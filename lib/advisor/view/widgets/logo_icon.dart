import 'package:finance_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LogoIcon extends StatelessWidget {
  const LogoIcon({
    super.key,
    this.size = 40,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Assets.images.advisor.advisorLogo.svg(
      width: size,
      height: size,
    );
  }
}
