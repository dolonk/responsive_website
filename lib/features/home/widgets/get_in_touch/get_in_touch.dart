import 'package:flutter/material.dart';
import 'package:responsive_website/features/home/widgets/get_in_touch/widgets/get_in_touch_card.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';

class GetInTouchSection extends StatelessWidget {
  const GetInTouchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd, vertical: s.spaceBtwSections),
      child: ResponsiveWidget(
        mobile: _buildMobileLayout(context),
        tablet: _buildTabletLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return GetInTouchCard(
      height: 400,
      imageHeight: 200,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -40,
      imageRightOffset: 20,
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    return GetInTouchCard(
      height: 350,
      imageHeight: 250,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -60,
      imageRightOffset: 40,
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return GetInTouchCard(
      height: 320,
      imageHeight: 300,
      imageAlignment: Alignment.topRight,
      imageTopOffset: -80,
      imageRightOffset: 60,
    );
  }
}

