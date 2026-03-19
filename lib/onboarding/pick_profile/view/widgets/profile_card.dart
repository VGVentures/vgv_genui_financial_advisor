import 'package:flutter/material.dart';
import 'package:vgv_genui_financial_advisor/design_system/design_system.dart';
import 'package:vgv_genui_financial_advisor/l10n/l10n.dart';
import 'package:vgv_genui_financial_advisor/onboarding/pick_profile/pick_profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.profileType,
    required this.isSelected,
    required this.onTap,
    this.isHovered = false,
    super.key,
  });

  final ProfileType profileType;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isHovered;

  @override
  Widget build(BuildContext context) {
    final colorExtensions = Theme.of(context).extension<AppColors>();
    final beginnerColor = colorExtensions?.primary ?? const Color(0xFF6D92F5);
    final optimizerColor = colorExtensions?.pinkColor;
    final l10n = context.l10n;
    final isOptimizer = profileType == ProfileType.optimizer;
    final titleColor = isOptimizer ? optimizerColor : beginnerColor;

    final title = isOptimizer
        ? l10n.profileOptimizerTitle
        : l10n.profileBeginnerTitle;
    final description = isOptimizer
        ? l10n.profileOptimizerDescription
        : l10n.profileBeginnerDescription;

    final isMobile = Breakpoints.isMobile(MediaQuery.of(context).size.width);

    final rotation = isMobile ? 0.0 : (isOptimizer ? 0.09 : -0.09);

    return Transform.rotate(
      angle: rotation,
      child: ConstrainedBox(
        constraints: isMobile
            ? const BoxConstraints(minHeight: 250)
            : const BoxConstraints(minHeight: 400),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              decoration: BoxDecoration(
                color: isSelected
                    ? Color.alphaBlend(
                        beginnerColor.withValues(alpha: 0.1),
                        colorExtensions?.surfaceVariant ?? Colors.white,
                      )
                    : colorExtensions?.surfaceVariant ?? Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? beginnerColor : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? Spacing.md : Spacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      width: isMobile
                          ? _Dimensions.mobileIconSize
                          : (isHovered
                                ? _Dimensions.iconSizeHover
                                : _Dimensions.iconSize),
                      height: isMobile
                          ? _Dimensions.mobileIconSize
                          : (isHovered
                                ? _Dimensions.iconSizeHover
                                : _Dimensions.iconSize),
                      child: Image.asset(profileType.iconAsset),
                    ),
                    if (isMobile)
                      const SizedBox(height: Spacing.xl)
                    else
                      const Spacer(),
                    SizedBox(
                      width: isMobile ? null : _Dimensions.textWidth,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        style:
                            (isMobile
                                    ? AppTextStyles.displaySmallMobile
                                    : AppTextStyles.displayLargeDesktop)
                                .copyWith(
                                  color: titleColor,
                                  fontSize: isMobile
                                      ? null
                                      : (isHovered
                                            ? _FontSizes.titleHover
                                            : _FontSizes.title),
                                ),
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.xs),
                    SizedBox(
                      width: isMobile ? null : _Dimensions.textWidth,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        style: isMobile
                            ? AppTextStyles.titleMediumMobile.copyWith(
                                color: colorExtensions?.onSurfaceVariant,
                              )
                            : AppTextStyles.headlineLargeDesktop.copyWith(
                                color: colorExtensions?.onSurfaceVariant,
                                fontWeight: FontWeight.w400,
                                fontSize: isHovered
                                    ? _FontSizes.descriptionHover
                                    : _FontSizes.description,
                              ),
                        child: Text(description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on ProfileType {
  String get iconAsset => switch (this) {
    ProfileType.beginner => 'assets/images/onboarding/StarBegginer.png',
    ProfileType.optimizer => 'assets/images/onboarding/StarOptimizer.png',
  };
}

abstract final class _Dimensions {
  static const double iconSize = 120;
  static const double iconSizeHover = 129;
  static const double mobileIconSize = 60;
  static const double textWidth = 402;
}

abstract final class _FontSizes {
  static const double title = 48;
  static const double titleHover = 50.4;
  static const double description = 32;
  static const double descriptionHover = 33.6;
}
