import 'dart:async';

import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/onboarding/pick_profile/pick_profile.dart';
import 'package:finance_app/onboarding/want_to_focus/view/want_to_focus_page.dart';
import 'package:finance_app/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickProfilePage extends StatelessWidget {
  const PickProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorExtensions = Theme.of(context).extension<AppColors>();
    final fabSize = responsiveValue(
      context,
      mobile: _Dimensions.mobileFabSize,
      desktop: _Dimensions.fabSize,
    );
    final fabIconSize = responsiveValue(
      context,
      mobile: _Dimensions.mobileFabIconSize,
      desktop: _Dimensions.fabIconSize,
    );

    return BlocProvider(
      create: (_) => PickProfileCubit(),
      child: Scaffold(
        backgroundColor:
            colorExtensions?.primarySurface ?? Colors.grey.shade200,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveValue(
                  context,
                  mobile: Spacing.xxl,
                  desktop: _Dimensions.horizontalPadding,
                ),
                vertical: responsiveValue(
                  context,
                  mobile: Spacing.md,
                  desktop: _Dimensions.verticalPadding,
                ),
              ),
              child: const PickProfileView(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: BlocBuilder<PickProfileCubit, PickProfileState>(
          builder: (context, state) => OnboardingNextButton(
            onPressed: state.hasSelection
                ? () {
                    unawaited(
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (_) => WantToFocusPage(
                            profileType: state.selectedProfile!,
                          ),
                        ),
                      ),
                    );
                  }
                : null,
          ),
        ),
      ),
    );
  }
}

abstract final class _Dimensions {
  // Mobile
  static const double mobileFabSize = 80;
  static const double mobileFabIconSize = 13;

  // Desktop
  static const double horizontalPadding = 200;
  static const double verticalPadding = 80;
  static const double fabSize = 140;
  static const double fabIconSize = 22;
}
