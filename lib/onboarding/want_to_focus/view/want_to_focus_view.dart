import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:finance_app/onboarding/want_to_focus/view/widgets/focus_options_desktop.dart';
import 'package:finance_app/onboarding/want_to_focus/view/widgets/focus_options_mobile.dart';
import 'package:finance_app/onboarding/want_to_focus/want_to_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WantToFocusView extends StatelessWidget {
  const WantToFocusView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final themeOf = Theme.of(context);
    final textTheme = themeOf.textTheme;
    final colorScheme = themeOf.colorScheme;
    final isDesktop = Breakpoints.isDesktop(MediaQuery.of(context).size.width);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: Spacing.xxxl,
        children: [
          Text(
            isDesktop
                ? l10n.whatDoYouWantToFocusLabel
                : l10n.whatWouldYouLikeToFocusLabel,
            style: textTheme.displayLarge?.copyWith(
              fontSize: isDesktop ? _Dimensions.titleSize : Spacing.xxl,
              color: colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          BlocBuilder<WantToFocusCubit, WantToFocusState>(
            builder: (context, state) {
              return const ResponsiveScaffold(
                desktop: FocusOptionsDesktop(),
                mobile: FocusOptionsMobile(),
              );
            },
          ),
        ],
      ),
    );
  }
}

abstract class _Dimensions {
  static const double titleSize = 48;
}
