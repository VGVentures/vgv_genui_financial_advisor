import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/onboarding/want_to_focus/want_to_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WantToFocusPage extends StatelessWidget {
  const WantToFocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorExtensions = Theme.of(context).extension<AppColors>();

    return BlocProvider(
      create: (_) => WantToFocusCubit(),
      child: Scaffold(
        backgroundColor: colorExtensions?.secondary.shade200,
        body: const SingleChildScrollView(
          child: Padding(
            // TODO(juanRodriguez17): This will change
            padding: EdgeInsets.all(50),
            child: WantToFocusView(),
          ),
        ),
      ),
    );
  }
}
