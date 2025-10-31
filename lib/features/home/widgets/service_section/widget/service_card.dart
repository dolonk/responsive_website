import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_website/utility/constants/icon_string.dart';
import '../../../../../common_function/style/hoverable_card.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../data_layer/model/service_model.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel serviceModel;

  const ServiceCard({super.key, required this.serviceModel});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SizedBox(
      width: 260,
      height: 280,
      child: HoverableCard(
        padding: EdgeInsets.all(s.paddingMd),
        backgroundColor: DColors.secondaryBackground,
        borderRadius: BorderRadius.circular(s.borderRadiusMd),
        onHoverChanged: (isHovered) => setState(() => _isHovered = isHovered),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            SvgPicture.asset(
              widget.serviceModel.iconPath,
              width: context.responsiveValue(mobile: 50, tablet: 56, desktop: 60),
              height: context.responsiveValue(mobile: 50, tablet: 56, desktop: 60),
              colorFilter: ColorFilter.mode(
                _isHovered ? DColors.primaryButton : DColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Title
            Text(widget.serviceModel.title, style: fonts.bodyLarge.rajdhani(fontWeight: FontWeight.w600)),
            SizedBox(height: s.paddingXs),

            // Subtitle
            Text(
              widget.serviceModel.subTitle,
              style: fonts.labelLarge.rubik(color: DColors.textSecondary, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: s.spaceBtwItems),

            // Description
            Expanded(
              child: Text(
                widget.serviceModel.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: fonts.labelMedium.rubik(color: DColors.textSecondary),
              ),
            ),
            SizedBox(height: s.paddingSm),

            // Bottom Row (See Details + Background Icon)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // See Details Link
                GestureDetector(
                  onTap: () {
                    // Navigate to service details
                  },
                  child: Text('See Details', style: fonts.bodySmall.rubik(color: DColors.primaryButton)),
                ),

                // Background Icon
                ImageIcon(
                  const AssetImage(DIcons.backgroundIcon),
                  size: context.responsiveValue(mobile: 48, tablet: 52, desktop: 56),
                  color: _isHovered
                      ? DColors.primaryButton.withAlpha((255 * 0.3).round())
                      : DColors.cardBorder,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
