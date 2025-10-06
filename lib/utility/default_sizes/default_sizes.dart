import '../responsive/responsive_helper.dart';

class DSizes {
  // Padding and margin
  static double paddingXs = _ResponsiveHelperSizes.getPadding('xs');
  static double paddingSm = _ResponsiveHelperSizes.getPadding('sm');
  static double paddingMd = _ResponsiveHelperSizes.getPadding('md');
  static double paddingLg = _ResponsiveHelperSizes.getPadding('lg');
  static double paddingXl = _ResponsiveHelperSizes.getPadding('xl');

  // Icon sizes
  static double iconXs = _ResponsiveHelperSizes.getIconSize('xs');
  static double iconSm = _ResponsiveHelperSizes.getIconSize('sm');
  static double iconMd = _ResponsiveHelperSizes.getIconSize('md');
  static double iconLg = _ResponsiveHelperSizes.getIconSize('lg');

  // Font sizes
  static double fontSizeSm = _ResponsiveHelperSizes.getFontSize('sm');
  static double fontSizeMd = _ResponsiveHelperSizes.getFontSize('md');
  static double fontSizeLg = _ResponsiveHelperSizes.getFontSize('lg');

  // Button sizes
  static Map<String, double> buttonSize = _ResponsiveHelperSizes.getButtonSize();

  // Spacing
  static double defaultSpace = _ResponsiveHelperSizes.getSpacing('default');
  static double spaceBtwItems = _ResponsiveHelperSizes.getSpacing('items');
  static double spaceBtwSections = _ResponsiveHelperSizes.getSpacing('sections');

  // Border radius
  static double borderRadiusSm = _ResponsiveHelperSizes.getBorderRadius('sm');
  static double borderRadiusMd = _ResponsiveHelperSizes.getBorderRadius('md');
  static double borderRadiusLg = _ResponsiveHelperSizes.getBorderRadius('lg');
}

// ============ Responsive Sizes Helper ============
class _ResponsiveHelperSizes {
  // Get responsive padding based on screen size
  static double getPadding(String size) {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.getPadding(size);
    } else if (DeviceType.isTablet) {
      return _TabletSizes.getPadding(size);
    } else {
      return _MobileSizes.getPadding(size);
    }
  }

  // Get responsive icon size
  static double getIconSize(String size) {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.getIconSize(size);
    } else if (DeviceType.isTablet) {
      return _TabletSizes.getIconSize(size);
    } else {
      return _MobileSizes.getIconSize(size);
    }
  }

  // Get responsive font size
  static double getFontSize(String size) {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.getFontSize(size);
    } else if (DeviceType.isTablet) {
      return _TabletSizes.getFontSize(size);
    } else {
      return _MobileSizes.getFontSize(size);
    }
  }

  // Get responsive spacing
  static double getSpacing(String type) {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.getSpacing(type);
    } else if (DeviceType.isTablet) {
      return _TabletSizes.getSpacing(type);
    } else {
      return _MobileSizes.getSpacing(type);
    }
  }

  // Get responsive border radius
  static double getBorderRadius(String size) {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.getBorderRadius(size);
    } else if (DeviceType.isTablet) {
      return _TabletSizes.getBorderRadius(size);
    } else {
      return _MobileSizes.getBorderRadius(size);
    }
  }

  // Get button dimensions
  static Map<String, double> getButtonSize() {
    if (DeviceType.isDesktop) {
      return _DesktopSizes.buttonSize;
    } else if (DeviceType.isTablet) {
      return _TabletSizes.buttonSize;
    } else {
      return _MobileSizes.buttonSize;
    }
  }
}

// ============ Mobile Sizes ============
class _MobileSizes {
  // Padding and margin
  static const double paddingXs = 4.0;
  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;
  static const double paddingXl = 32.0;

  static double getPadding(String size) {
    switch (size) {
      case 'xs':
        return paddingXs;
      case 'sm':
        return paddingSm;
      case 'md':
        return paddingMd;
      case 'lg':
        return paddingLg;
      case 'xl':
        return paddingXl;
      default:
        return paddingMd;
    }
  }

  // Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  static double getIconSize(String size) {
    switch (size) {
      case 'xs':
        return iconXs;
      case 'sm':
        return iconSm;
      case 'md':
        return iconMd;
      case 'lg':
        return iconLg;
      default:
        return iconMd;
    }
  }

  // Font sizes
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  static double getFontSize(String size) {
    switch (size) {
      case 'sm':
        return fontSizeSm;
      case 'md':
        return fontSizeMd;
      case 'lg':
        return fontSizeLg;
      default:
        return fontSizeMd;
    }
  }

  // Button sizes
  static const Map<String, double> buttonSize = {
    'radius': 6.0,
    'height': 44.0,
    'width': 120.0,
    'elevation': 4.0,
  };

  // Spacing
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  static double getSpacing(String type) {
    switch (type) {
      case 'default':
        return defaultSpace;
      case 'items':
        return spaceBtwItems;
      case 'sections':
        return spaceBtwSections;
      default:
        return defaultSpace;
    }
  }

  // Border radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  static double getBorderRadius(String size) {
    switch (size) {
      case 'sm':
        return borderRadiusSm;
      case 'md':
        return borderRadiusMd;
      case 'lg':
        return borderRadiusLg;
      default:
        return borderRadiusMd;
    }
  }
}

// ============ Tablet Sizes ============
class _TabletSizes {
  // Padding and margin (20% larger than mobile)
  static const double paddingXs = 5.0;
  static const double paddingSm = 10.0;
  static const double paddingMd = 20.0;
  static const double paddingLg = 30.0;
  static const double paddingXl = 40.0;

  static double getPadding(String size) {
    switch (size) {
      case 'xs':
        return paddingXs;
      case 'sm':
        return paddingSm;
      case 'md':
        return paddingMd;
      case 'lg':
        return paddingLg;
      case 'xl':
        return paddingXl;
      default:
        return paddingMd;
    }
  }

  // Icon sizes
  static const double iconXs = 14.0;
  static const double iconSm = 20.0;
  static const double iconMd = 28.0;
  static const double iconLg = 38.0;

  static double getIconSize(String size) {
    switch (size) {
      case 'xs':
        return iconXs;
      case 'sm':
        return iconSm;
      case 'md':
        return iconMd;
      case 'lg':
        return iconLg;
      default:
        return iconMd;
    }
  }

  // Font sizes
  static const double fontSizeSm = 15.0;
  static const double fontSizeMd = 17.0;
  static const double fontSizeLg = 20.0;

  static double getFontSize(String size) {
    switch (size) {
      case 'sm':
        return fontSizeSm;
      case 'md':
        return fontSizeMd;
      case 'lg':
        return fontSizeLg;
      default:
        return fontSizeMd;
    }
  }

  // Button sizes
  static const Map<String, double> buttonSize = {
    'radius': 8.0,
    'height': 48.0,
    'width': 140.0,
    'elevation': 4.0,
  };

  // Spacing
  static const double defaultSpace = 30.0;
  static const double spaceBtwItems = 20.0;
  static const double spaceBtwSections = 40.0;

  static double getSpacing(String type) {
    switch (type) {
      case 'default':
        return defaultSpace;
      case 'items':
        return spaceBtwItems;
      case 'sections':
        return spaceBtwSections;
      default:
        return defaultSpace;
    }
  }

  // Border radius
  static const double borderRadiusSm = 6.0;
  static const double borderRadiusMd = 10.0;
  static const double borderRadiusLg = 14.0;

  static double getBorderRadius(String size) {
    switch (size) {
      case 'sm':
        return borderRadiusSm;
      case 'md':
        return borderRadiusMd;
      case 'lg':
        return borderRadiusLg;
      default:
        return borderRadiusMd;
    }
  }
}

// ============ Desktop Sizes ============
class _DesktopSizes {
  // Padding and margin (50% larger than mobile)
  static const double paddingXs = 6.0;
  static const double paddingSm = 12.0;
  static const double paddingMd = 24.0;
  static const double paddingLg = 36.0;
  static const double paddingXl = 48.0;

  static double getPadding(String size) {
    switch (size) {
      case 'xs':
        return paddingXs;
      case 'sm':
        return paddingSm;
      case 'md':
        return paddingMd;
      case 'lg':
        return paddingLg;
      case 'xl':
        return paddingXl;
      default:
        return paddingMd;
    }
  }

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 24.0;
  static const double iconMd = 32.0;
  static const double iconLg = 48.0;

  static double getIconSize(String size) {
    switch (size) {
      case 'xs':
        return iconXs;
      case 'sm':
        return iconSm;
      case 'md':
        return iconMd;
      case 'lg':
        return iconLg;
      default:
        return iconMd;
    }
  }

  // Font sizes
  static const double fontSizeSm = 16.0;
  static const double fontSizeMd = 18.0;
  static const double fontSizeLg = 22.0;

  static double getFontSize(String size) {
    switch (size) {
      case 'sm':
        return fontSizeSm;
      case 'md':
        return fontSizeMd;
      case 'lg':
        return fontSizeLg;
      default:
        return fontSizeMd;
    }
  }

  // Button sizes
  static const Map<String, double> buttonSize = {
    'radius': 8.0,
    'height': 52.0,
    'width': 160.0,
    'elevation': 4.0,
  };

  // Spacing
  static const double defaultSpace = 36.0;
  static const double spaceBtwItems = 24.0;
  static const double spaceBtwSections = 48.0;

  static double getSpacing(String type) {
    switch (type) {
      case 'default':
        return defaultSpace;
      case 'items':
        return spaceBtwItems;
      case 'sections':
        return spaceBtwSections;
      default:
        return defaultSpace;
    }
  }

  // Border radius
  static const double borderRadiusSm = 6.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;

  static double getBorderRadius(String size) {
    switch (size) {
      case 'sm':
        return borderRadiusSm;
      case 'md':
        return borderRadiusMd;
      case 'lg':
        return borderRadiusLg;
      default:
        return borderRadiusMd;
    }
  }
}
