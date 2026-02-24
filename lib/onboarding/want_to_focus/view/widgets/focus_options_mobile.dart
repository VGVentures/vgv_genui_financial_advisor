import 'package:finance_app/app/presentation.dart';
import 'package:finance_app/l10n/l10n.dart';
import 'package:finance_app/onboarding/want_to_focus/want_to_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FocusOptionsMobile extends StatelessWidget {
  const FocusOptionsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<WantToFocusCubit, WantToFocusState>(
      builder: (context, state) {
        return Row(
          spacing: Spacing.xl,
          children: [
            Expanded(
              child: Column(
                spacing: Spacing.xs,
                children: [
                  SelectableOptionCard(
                    label: l10n.everydaySpendingLabel,
                    isSelected: state.selectedOptions.contains(
                      l10n.everydaySpendingLabel,
                    ),
                    isMobile: true,
                    onTap: () => context.read<WantToFocusCubit>().toggleOption(
                      l10n.everydaySpendingLabel,
                    ),
                  ),
                  SelectableOptionCard(
                    label: l10n.saveForRetirementLabel,
                    isSelected: state.selectedOptions.contains(
                      l10n.saveForRetirementLabel,
                    ),
                    isMobile: true,
                    onTap: () => context.read<WantToFocusCubit>().toggleOption(
                      l10n.saveForRetirementLabel,
                    ),
                  ),
                  SelectableOptionCard(
                    label: l10n.mortgageLabel,
                    isSelected: state.selectedOptions.contains(
                      l10n.mortgageLabel,
                    ),
                    isMobile: true,
                    onTap: () => context.read<WantToFocusCubit>().toggleOption(
                      l10n.mortgageLabel,
                    ),
                  ),
                  SelectableOptionCard(
                    label: l10n.housingAndFixedCostsLabel,
                    isSelected: state.selectedOptions.contains(
                      l10n.housingAndFixedCostsLabel,
                    ),
                    isMobile: true,
                    onTap: () => context.read<WantToFocusCubit>().toggleOption(
                      l10n.housingAndFixedCostsLabel,
                    ),
                  ),
                  SelectableOptionCard(
                    label: l10n.healthcareAndInsuranceLabel,
                    isSelected: state.selectedOptions.contains(
                      l10n.healthcareAndInsuranceLabel,
                    ),
                    isMobile: true,
                    onTap: () => context.read<WantToFocusCubit>().toggleOption(
                      l10n.healthcareAndInsuranceLabel,
                    ),
                  ),
                  WriteYourOwnOptionCard(
                    label: l10n.writeYourOwnLabel,
                    onChanged: (text) =>
                        context.read<WantToFocusCubit>().setCustomOption(text),
                    isMobile: true,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
