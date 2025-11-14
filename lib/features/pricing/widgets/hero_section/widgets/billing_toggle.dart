import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';

class BillingToggle extends StatelessWidget {
  final bool isYearly;
  final Function(bool) onChanged;

  const BillingToggle({super.key, required this.isYearly, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: DColors.cardBackground,
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(
            context: context,
            label: 'Monthly',
            isSelected: !isYearly,
            onTap: () => onChanged(false),
            s: s,
            fonts: fonts,
          ),
          SizedBox(width: 4),
          _buildOption(
            context: context,
            label: 'Yearly',
            isSelected: isYearly,
            onTap: () => onChanged(true),
            s: s,
            fonts: fonts,
            badge: 'Save 20%',
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required DSizes s,
    required AppFonts fonts,
    String? badge,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: s.paddingLg, vertical: s.paddingMd),
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [DColors.primaryButton, Color(0xFFD4003D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: fonts.bodyMedium.rubik(
                  color: isSelected ? Colors.white : DColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              if (badge != null && isSelected) ...[
                SizedBox(width: s.paddingSm),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: s.paddingSm, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((255 * 0.2).round()),
                    borderRadius: BorderRadius.circular(s.borderRadiusSm),
                  ),
                  child: Text(
                    badge,
                    style: fonts.labelSmall.rubik(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
