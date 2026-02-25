import 'package:finance_app/intro/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template intro_mobile_view}
/// Mobile layout for the intro screen.
/// {@endtemplate}
class IntroMobileView extends StatelessWidget {
  /// {@macro intro_mobile_view}
  const IntroMobileView({this.onGetStarted, super.key});

  /// Called when the "Get started" button is pressed.
  final VoidCallback? onGetStarted;

  static const _backgroundColor = Color(0xFF0D1537);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const IntroBadge(),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Gen UI x ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  TextSpan(
                    text: 'VGV',
                    style: TextStyle(
                      color: Color(0xFFA89FE8),
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'This demo shows how Generative UI transforms financial '
                'products from static dashboards into adaptive experiences. '
                'The UI reshapes itself based on goals, behavior, and context',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GetStartedButton(onPressed: onGetStarted),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
