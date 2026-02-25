import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:finance_app/onboarding/pick_profile/pick_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickProfileView extends StatelessWidget {
  const PickProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorExtensions = Theme.of(context).extension<AppColors>();
    final isMobile = Breakpoints.isMobile(MediaQuery.of(context).size.width);

    return BlocBuilder<PickProfileCubit, PickProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: isMobile ? 60 : _Dimensions.titleSpacing,
            ),
            Text(
              context.l10n.pickProfileTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile
                    ? _Dimensions.mobileTitleFontSize
                    : _Dimensions.titleFontSize,
                fontWeight: FontWeight.w800,
                color: colorExtensions?.secondary.shade900,
              ),
            ),
            SizedBox(
              height: isMobile ? Spacing.xl : _Dimensions.cardsTopSpacing,
            ),
            if (isMobile)
              _MobileCards(selectedProfile: state.selectedProfile)
            else
              _DesktopCards(selectedProfile: state.selectedProfile),
          ],
        );
      },
    );
  }
}

class _MobileCards extends StatelessWidget {
  const _MobileCards({required this.selectedProfile});

  final ProfileType? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final type in ProfileType.values)
          Padding(
            padding: const EdgeInsets.only(bottom: Spacing.md),
            child: ProfileCard(
              profileType: type,
              isSelected: selectedProfile == type,
              onTap: () => context.read<PickProfileCubit>().selectProfile(type),
            ),
          ),
      ],
    );
  }
}

class _DesktopCards extends StatelessWidget {
  const _DesktopCards({required this.selectedProfile});

  final ProfileType? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final type in ProfileType.values)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: _Dimensions.cardSpacing),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: _Dimensions.cardWidth,
                ),
                child: ProfileCard(
                  profileType: type,
                  isSelected: selectedProfile == type,
                  onTap: () =>
                      context.read<PickProfileCubit>().selectProfile(type),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

abstract final class _Dimensions {
  static const double titleFontSize = 35;
  static const double mobileTitleFontSize = 25;
  static const double titleSpacing = 40;
  static const double cardsTopSpacing = 70;
  static const double cardSpacing = 50;
  static const double cardWidth = 450;
}
