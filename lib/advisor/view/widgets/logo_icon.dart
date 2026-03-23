import 'package:flutter/material.dart';
import 'package:vgv_genui_financial_advisor/gen/assets.gen.dart';

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
