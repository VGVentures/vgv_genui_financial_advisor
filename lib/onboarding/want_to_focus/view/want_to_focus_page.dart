import 'dart:developer';

import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/gen/assets.gen.dart';
import 'package:finance_app/onboarding/want_to_focus/want_to_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WantToFocusPage extends StatelessWidget {
  const WantToFocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorExtensions = Theme.of(context).extension<AppColors>();
    final isMobile = Breakpoints.isMobile(MediaQuery.of(context).size.width);

    return BlocProvider(
      create: (_) => WantToFocusCubit(),
      child: Scaffold(
        backgroundColor: colorExtensions?.secondary.shade200,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? Spacing.xxl
                  : _Dimensions.horizontalPadding,
              vertical: isMobile ? Spacing.md : _Dimensions.verticalPadding,
            ),
            child: const WantToFocusView(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (context) => SizedBox(
            width: isMobile ? _Dimensions.mobileFabSize : _Dimensions.fabSize,
            height: isMobile ? _Dimensions.mobileFabSize : _Dimensions.fabSize,
            child: FloatingActionButton(
              onPressed: () {
                // TODO(juanRodriguez17): Add navigation to the next screen
                //when gets merged
                final bloc = context.read<WantToFocusCubit>();
                final focusOptions = bloc.state.selectedOptions.toList()
                  ..add(bloc.state.customOption);
                log('Focus Options($focusOptions)');
              },
              backgroundColor:
                  colorExtensions?.transparent ?? Colors.transparent,
              hoverColor: colorExtensions?.secondary.shade200,
              elevation: 0,
              shape: CircleBorder(
                side: BorderSide(
                  color:
                      colorExtensions?.secondary.shade700 ??
                      colorExtensions?.transparent ??
                      Colors.transparent,
                ),
              ),
              child: Assets.images.onboarding.rightArrow.image(
                color: colorExtensions?.secondary.shade700,
                width: isMobile
                    ? _Dimensions.mobileFabIconSize
                    : _Dimensions.fabIconSize,
                height: isMobile
                    ? _Dimensions.mobileFabIconSize
                    : _Dimensions.fabIconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

abstract final class _Dimensions {
  static const double horizontalPadding = 200;
  static const double verticalPadding = 120;
  static const double fabSize = 140;
  static const double fabIconSize = 22;
  static const double mobileFabSize = 80;
  static const double mobileFabIconSize = 13;
}
