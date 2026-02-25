import 'package:finance_app/intro/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// {@template intro_desktop_view}
/// Desktop layout for the intro screen.
/// {@endtemplate}
class IntroDesktopView extends StatelessWidget {
  /// {@macro intro_desktop_view}
  const IntroDesktopView({this.onGetStarted, super.key});

  /// Called when the "Get started" button is pressed.
  final VoidCallback? onGetStarted;

  static const _backgroundColor = Color(0xFF0D1537);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IntroBadge(),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Gen UI x ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  TextSpan(
                    text: 'VGV',
                    style: TextStyle(
                      color: Color(0xFFA89FE8),
                      fontSize: 80,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(
              width: 720,
              child: Text(
                'This demo shows how Generative UI transforms financial '
                'products from static dashboards into adaptive experiences. '
                'The UI reshapes itself based on goals, behavior, and context.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: 280,
              child: GetStartedButton(
                onPressed: onGetStarted,
                label: 'GET STARTED',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
