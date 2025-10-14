import 'package:flutter/widgets.dart';
import '../responsive/responsive_helper.dart';

class DSizes {
  factory DSizes.of(BuildContext context) => DSizes._fromContext(context);

  // Padding sizes
  final double paddingXs;
  final double paddingSm;
  final double paddingMd;
  final double paddingLg;
  final double paddingXl;

  // Icon sizes
  final double iconXs;
  final double iconSm;
  final double iconMd;
  final double iconLg;

  // Button sizes
  final double buttonRadius;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonElevation;

  // Spacing sizes
  final double defaultSpace;
  final double spaceBtwItems;
  final double spaceBtwSections;

  // Border radius sizes
  final double borderRadiusSm;
  final double borderRadiusMd;
  final double borderRadiusLg;

  /*// ✅ Display font sizes (Hero section)
  final double displayLarge;
  final double displayMedium;
  final double displaySmall;

  // ✅ Headline font sizes (Section titles)
  final double headlineLarge;
  final double headlineMedium;
  final double headlineSmall;

  // ✅ Title font sizes (Subheadings)
  final double titleLarge;
  final double titleMedium;
  final double titleSmall;

  // ✅ Body font sizes (Normal text)
  final double bodyLarge;
  final double bodyMedium;
  final double bodySmall;

  // ✅ Label font sizes (Small text, captions)
  final double labelLarge;
  final double labelMedium;
  final double labelSmall;*/

  // Private named constructor with all finals initialized
  DSizes._internal({
    // Padding sizes
    required this.paddingXs,
    required this.paddingSm,
    required this.paddingMd,
    required this.paddingLg,
    required this.paddingXl,

    // Icon sizes
    required this.iconXs,
    required this.iconSm,
    required this.iconMd,
    required this.iconLg,

    // Button sizes
    required this.buttonRadius,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonElevation,

    // Spacing sizes
    required this.defaultSpace,
    required this.spaceBtwItems,
    required this.spaceBtwSections,

    // Border radius sizes
    required this.borderRadiusSm,
    required this.borderRadiusMd,
    required this.borderRadiusLg,

   /* // ✅ Display font sizes
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,

    // ✅ Headline font sizes
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,

    // ✅ Title font sizes
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,

    // ✅ Body font sizes
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,

    // ✅ Label font sizes
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,*/
  });

  // Build DSizes instance dynamically based on context
  factory DSizes._fromContext(BuildContext context) {
    final mobile = _MobileSizes();
    final tablet = _TabletSizes();
    final desktop = _DesktopSizes();

    T res<T>(T Function(_MobileSizes m) m, T Function(_TabletSizes t) t, T Function(_DesktopSizes d) d) {
      return ResponsiveHelper.value(context, mobile: m(mobile), tablet: t(tablet), desktop: d(desktop));
    }

    return DSizes._internal(
      // Padding sizes
      paddingXs: res((m) => m.paddingXs, (t) => t.paddingXs, (d) => d.paddingXs),
      paddingSm: res((m) => m.paddingSm, (t) => t.paddingSm, (d) => d.paddingSm),
      paddingMd: res((m) => m.paddingMd, (t) => t.paddingMd, (d) => d.paddingMd),
      paddingLg: res((m) => m.paddingLg, (t) => t.paddingLg, (d) => d.paddingLg),
      paddingXl: res((m) => m.paddingXl, (t) => t.paddingXl, (d) => d.paddingXl),

      // Icon sizes
      iconXs: res((m) => m.iconXs, (t) => t.iconXs, (d) => d.iconXs),
      iconSm: res((m) => m.iconSm, (t) => t.iconSm, (d) => d.iconSm),
      iconMd: res((m) => m.iconMd, (t) => t.iconMd, (d) => d.iconMd),
      iconLg: res((m) => m.iconLg, (t) => t.iconLg, (d) => d.iconLg),

      // Button sizes
      buttonRadius: res((m) => m.buttonRadius, (t) => t.buttonRadius, (d) => d.buttonRadius),
      buttonHeight: res((m) => m.buttonHeight, (t) => t.buttonHeight, (d) => d.buttonHeight),
      buttonWidth: res((m) => m.buttonWidth, (t) => t.buttonWidth, (d) => d.buttonWidth),
      buttonElevation: res((m) => m.buttonElevation, (t) => t.buttonElevation, (d) => d.buttonElevation),

      // Spacing sizes
      defaultSpace: res((m) => m.defaultSpace, (t) => t.defaultSpace, (d) => d.defaultSpace),
      spaceBtwItems: res((m) => m.spaceBtwItems, (t) => t.spaceBtwItems, (d) => d.spaceBtwItems),
      spaceBtwSections: res((m) => m.spaceBtwSections, (t) => t.spaceBtwSections, (d) => d.spaceBtwSections),

      // Border radius sizes
      borderRadiusSm: res((m) => m.borderRadiusSm, (t) => t.borderRadiusSm, (d) => d.borderRadiusSm),
      borderRadiusMd: res((m) => m.borderRadiusMd, (t) => t.borderRadiusMd, (d) => d.borderRadiusMd),
      borderRadiusLg: res((m) => m.borderRadiusLg, (t) => t.borderRadiusLg, (d) => d.borderRadiusLg),
/*
      // ✅ Display font sizes
      displayLarge: res((m) => m.displayLarge, (t) => t.displayLarge, (d) => d.displayLarge),
      displayMedium: res((m) => m.displayMedium, (t) => t.displayMedium, (d) => d.displayMedium),
      displaySmall: res((m) => m.displaySmall, (t) => t.displaySmall, (d) => d.displaySmall),

      // ✅ Headline font sizes
      headlineLarge: res((m) => m.headlineLarge, (t) => t.headlineLarge, (d) => d.headlineLarge),
      headlineMedium: res((m) => m.headlineMedium, (t) => t.headlineMedium, (d) => d.headlineMedium),
      headlineSmall: res((m) => m.headlineSmall, (t) => t.headlineSmall, (d) => d.headlineSmall),

      // ✅ Title font sizes
      titleLarge: res((m) => m.titleLarge, (t) => t.titleLarge, (d) => d.titleLarge),
      titleMedium: res((m) => m.titleMedium, (t) => t.titleMedium, (d) => d.titleMedium),
      titleSmall: res((m) => m.titleSmall, (t) => t.titleSmall, (d) => d.titleSmall),

      // ✅ Body font sizes
      bodyLarge: res((m) => m.bodyLarge, (t) => t.bodyLarge, (d) => d.bodyLarge),
      bodyMedium: res((m) => m.bodyMedium, (t) => t.bodyMedium, (d) => d.bodyMedium),
      bodySmall: res((m) => m.bodySmall, (t) => t.bodySmall, (d) => d.bodySmall),

      // ✅ Label font sizes
      labelLarge: res((m) => m.labelLarge, (t) => t.labelLarge, (d) => d.labelLarge),
      labelMedium: res((m) => m.labelMedium, (t) => t.labelMedium, (d) => d.labelMedium),
      labelSmall: res((m) => m.labelSmall, (t) => t.labelSmall, (d) => d.labelSmall),*/
    );
  }
}

/// ============== DEVICE-SPECIFIC SIZE DEFINITIONS =================
class _MobileSizes {
  // Padding sizes
  final double paddingXs = 4.0;
  final double paddingSm = 8.0;
  final double paddingMd = 16.0;
  final double paddingLg = 24.0;
  final double paddingXl = 32.0;

  // Icon sizes
  final double iconXs = 12.0;
  final double iconSm = 16.0;
  final double iconMd = 24.0;
  final double iconLg = 32.0;

  // Button sizes
  final double buttonRadius = 6.0;
  final double buttonHeight = 44.0;
  final double buttonWidth = 120.0;
  final double buttonElevation = 4.0;

  // Spacing sizes
  final double defaultSpace = 24.0;
  final double spaceBtwItems = 16.0;
  final double spaceBtwSections = 32.0;

  // Border radius sizes
  final double borderRadiusSm = 4.0;
  final double borderRadiusMd = 8.0;
  final double borderRadiusLg = 12.0;

  // Display font sizes (Hero section)
  final double displayLarge = 32.0;
  final double displayMedium = 28.0;
  final double displaySmall = 24.0;

  // Headline font sizes (Section titles)
  final double headlineLarge = 22.0;
  final double headlineMedium = 20.0;
  final double headlineSmall = 18.0;

  // Title font sizes (Subheadings)
  final double titleLarge = 18.0;
  final double titleMedium = 16.0;
  final double titleSmall = 14.0;

  // Body font sizes (Normal text)
  final double bodyLarge = 16.0;
  final double bodyMedium = 14.0;
  final double bodySmall = 12.0;

  // Label font sizes (Small text, captions)
  final double labelLarge = 14.0;
  final double labelMedium = 12.0;
  final double labelSmall = 10.0;
}

class _TabletSizes {
  // Padding sizes
  final double paddingXs = 5.0;
  final double paddingSm = 10.0;
  final double paddingMd = 20.0;
  final double paddingLg = 30.0;
  final double paddingXl = 40.0;

  // Icon sizes
  final double iconXs = 14.0;
  final double iconSm = 20.0;
  final double iconMd = 28.0;
  final double iconLg = 38.0;

  // Button sizes
  final double buttonRadius = 8.0;
  final double buttonHeight = 48.0;
  final double buttonWidth = 140.0;
  final double buttonElevation = 4.0;

  // Spacing sizes
  final double defaultSpace = 30.0;
  final double spaceBtwItems = 20.0;
  final double spaceBtwSections = 40.0;

  // Border radius sizes
  final double borderRadiusSm = 6.0;
  final double borderRadiusMd = 10.0;
  final double borderRadiusLg = 14.0;

  // Display font sizes (Hero section)
  final double displayLarge = 40.0;
  final double displayMedium = 36.0;
  final double displaySmall = 32.0;

  // Headline font sizes (Section titles)
  final double headlineLarge = 28.0;
  final double headlineMedium = 26.0;
  final double headlineSmall = 24.0;

  // Title font sizes (Subheadings)
  final double titleLarge = 22.0;
  final double titleMedium = 20.0;
  final double titleSmall = 18.0;

  // Body font sizes (Normal text)
  final double bodyLarge = 18.0;
  final double bodyMedium = 16.0;
  final double bodySmall = 14.0;

  // Label font sizes (Small text, captions)
  final double labelLarge = 14.0;
  final double labelMedium = 12.0;
  final double labelSmall = 10.0;
}

class _DesktopSizes {
  // Padding sizes
  final double paddingXs = 6.0;
  final double paddingSm = 12.0;
  final double paddingMd = 24.0;
  final double paddingLg = 36.0;
  final double paddingXl = 48.0;

  // Icon sizes
  final double iconXs = 16.0;
  final double iconSm = 24.0;
  final double iconMd = 32.0;
  final double iconLg = 48.0;

  // Button sizes
  final double buttonRadius = 8.0;
  final double buttonHeight = 52.0;
  final double buttonWidth = 160.0;
  final double buttonElevation = 4.0;

  // Spacing sizes
  final double defaultSpace = 36.0;
  final double spaceBtwItems = 24.0;
  final double spaceBtwSections = 48.0;

  // Border radius sizes
  final double borderRadiusSm = 6.0;
  final double borderRadiusMd = 12.0;
  final double borderRadiusLg = 16.0;

  // Display font sizes (Hero section)
  final double displayLarge = 48.0;
  final double displayMedium = 44.0;
  final double displaySmall = 40.0;

  // Headline font sizes (Section titles)
  final double headlineLarge = 32.0;
  final double headlineMedium = 28.0;
  final double headlineSmall = 26.0;

  // Title font sizes (Subheadings)
  final double titleLarge = 26.0;
  final double titleMedium = 24.0;
  final double titleSmall = 22.0;

  // Body font sizes (Normal text)
  final double bodyLarge = 20.0;
  final double bodyMedium = 18.0;
  final double bodySmall = 16.0;

  // Label font sizes (Small text, captions)
  final double labelLarge = 16.0;
  final double labelMedium = 14.0;
  final double labelSmall = 12.0;
}

/// ✅ General spacing/padding extension
extension ResponsiveSizesShorthand on BuildContext {
  DSizes get sizes => DSizes.of(this);
}


