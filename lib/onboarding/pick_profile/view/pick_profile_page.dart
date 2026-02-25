import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/onboarding/pick_profile/pick_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickProfilePage extends StatelessWidget {
  const PickProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.isMobile(MediaQuery.of(context).size.width);

    return BlocProvider(
      create: (_) => PickProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? Spacing.xxl
                  : _Dimensions.horizontalPadding,
              vertical: isMobile ? Spacing.md : _Dimensions.verticalPadding,
            ),
            child: const PickProfileView(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Builder(
          builder: (context) {
            final isMobile = Breakpoints.isMobile(
              MediaQuery.of(context).size.width,
            );
            return Image.asset(
              'assets/images/onboarding/Next.png',
              width: isMobile ? _Dimensions.mobileFabSize : _Dimensions.fabSize,
              height: isMobile
                  ? _Dimensions.mobileFabSize
                  : _Dimensions.fabSize,
            );
          },
        ),
      ),
    );
  }
}

abstract final class _Dimensions {
  static const double horizontalPadding = 200;
  static const double verticalPadding = 40;
  static const double fabSize = 140;
  static const double mobileFabSize = 80;
}
