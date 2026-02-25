import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/onboarding/view/widgets/trust_badge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KickOffPage extends StatelessWidget {
  const KickOffPage({super.key});

  void _onNextPressed() {
    // TO-DO: navigate to next page
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    final bgColor = appColors.accentBlue;

    final body = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Transform.rotate(
                      angle: -0.03,
                      child: TrustBadge(
                        text: 'Nothing is hardcoded!',
                        backgroundColor: appColors.badgeDarkBlue,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Transform.rotate(
                      angle: 0.03,
                      child: TrustBadge(
                        text: 'You can trust us',
                        backgroundColor: appColors.badgeWhite,
                        textColor: appColors.badgeTextBlueColor,
                        icon: Image.asset(
                          'assets/icons_kick_off/check_icon.png',
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Let's kick things off!",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 48,
                height: 80 / 64,
                letterSpacing: -1,
                color: const Color(0xFFF9FAFB),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "For this demo, we're using VGV Finances as our hypothetical app. "
              "We've set up two user profiles — choose one, set your preferences, and watch "
              "Gen UI build the experience around you in real time.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                height: 1.5,
                letterSpacing: 0,
                color: const Color(0xFFF9FAFB),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    final button = Padding(
      padding: const EdgeInsets.only(bottom: 30, right: 20),
      child: OutlinedButton(
        onPressed: _onNextPressed,
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          side: const BorderSide(color: Colors.white, width: 1.1),
          padding: const EdgeInsets.all(40),
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );

    // Top right decoration with stars and activity zone
    const topRightDecoration = Positioned(
      top: 60,
      right: 40,
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          children: [
            // Small star top left
            Positioned(
              top: 0,
              left: 20,
              child: Image(
                image: AssetImage('assets/icons_kick_off/Soft Star.png'),
                width: 20,
                height: 20,
              ),
            ),
            // Large star top right
            Positioned(
              top: 10,
              right: 0,
              child: Opacity(
                opacity: 0.7,
                child: Image(
                  image: AssetImage('assets/icons_kick_off/Star 7.png'),
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            // Activity zone (cube) center
            Positioned(
              top: 80,
              left: 40,
              child: Opacity(
                opacity: 0.7,
                child: Image(
                  image: AssetImage('assets/icons_kick_off/activity_zone.png'),
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            // Small star bottom right
            Positioned(
              bottom: 20,
              right: 30,
              child: Image(
                image: AssetImage('assets/icons_kick_off/Star 9.png'),
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );

    // Bottom left decoration with stars and flare
    const bottomLeftDecoration = Positioned(
      bottom: 80,
      left: 40,
      child: SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          children: [
            // Star top left
            Positioned(
              top: 0,
              left: 20,
              child: Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/icons_kick_off/Star 7.png'),
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            // Flare center
            Positioned(
              top: 100,
              left: 60,
              child: Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/icons_kick_off/flare.png'),
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            // Small star right
            Positioned(
              top: 120,
              right: 40,
              child: Image(
                image: AssetImage('assets/icons_kick_off/Star 11.png'),
                width: 12,
                height: 12,
              ),
            ),
            // Soft star bottom left
            Positioned(
              bottom: 0,
              left: 10,
              child: Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/icons_kick_off/Soft Star.png'),
                  width: 21,
                  height: 21,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final decoratedBody = Stack(
      children: [
        body,
        topRightDecoration,
        bottomLeftDecoration,
      ],
    );

    return ResponsiveScaffold(
      mobile: Scaffold(
        backgroundColor: bgColor,
        body: decoratedBody,
        floatingActionButton: button,
      ),
      desktop: Scaffold(
        backgroundColor: bgColor,
        body: decoratedBody,
        floatingActionButton: button,
      ),
    );
  }
}
