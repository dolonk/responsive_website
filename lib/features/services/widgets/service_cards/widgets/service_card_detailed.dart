import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/style/custom_button.dart';
import 'package:responsive_website/common_function/style/hoverable_card.dart';
import 'package:responsive_website/data_layer/model/service_detail_model.dart';
import 'package:responsive_website/features/services/widgets/service_cards/widgets/tech_badge.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

import 'deliverable_item.dart';

class ServiceCardDetailed extends StatefulWidget {
  final ServiceDetailModel service;

  const ServiceCardDetailed({super.key, required this.service});

  @override
  State<ServiceCardDetailed> createState() => _ServiceCardDetailedState();
}

class _ServiceCardDetailedState extends State<ServiceCardDetailed> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    /*return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: Container(
          padding: EdgeInsets.all(s.paddingLg),
          decoration: BoxDecoration(
            color: DColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered ? DColors.primaryButton.withAlpha((255 * 0.5).round()) : DColors.cardBorder,
              width: 2,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: DColors.primaryButton.withAlpha((255 * 0.2).round()),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Circle
              _buildIconCircle(s),
              SizedBox(height: s.spaceBtwItems),

              // Title
              Text(widget.service.title, style: fonts.headlineMedium.rajdhani(fontWeight: FontWeight.bold)),
              SizedBox(height: s.paddingSm),

              // Description
              Text(
                widget.service.description,
                style: fonts.bodyMedium.rubik(color: DColors.textSecondary, height: 1.6),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: s.spaceBtwItems),

              // Divider
              Divider(color: DColors.cardBorder),
              SizedBox(height: s.paddingSm),

              // Deliverables List
              Text('Key Deliverables:', style: fonts.labelLarge.rubik(fontWeight: FontWeight.w600)),
              SizedBox(height: s.paddingSm),
              ...widget.service.deliverables!.map((item) => DeliverableItem(text: item)),
              SizedBox(height: s.spaceBtwItems),

              // Tech Stack Badges
              Wrap(
                //spacing: s.paddingSm,
                spacing: s.spaceBtwSections,
                runSpacing: s.paddingSm,
                children: widget.service.technologies!.map((tech) => TechBadge(techName: tech)).toList(),
              ),
              SizedBox(height: s.spaceBtwItems),

              // Divider
              Divider(color: DColors.cardBorder),
              SizedBox(height: s.paddingSm),

              // Price & Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Text(
                    widget.service.pricing!,
                    style: fonts.headlineSmall.rajdhani(color: DColors.primaryButton, fontWeight: FontWeight.bold),
                  ),

                  // Button
                  CustomButton(
                    onPressed: () {
                      // TODO: Navigate to contact page
                      debugPrint('${widget.service.title} - ${widget.service.buttonText} clicked');
                    },
                    tittleText: widget.service.buttonText ?? "",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );*/
    return HoverableCard(
      padding: EdgeInsets.all(s.paddingLg),
      onHoverChanged: (isHovered) => setState(() => _isHovered = isHovered),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          _buildIconCircle(s),
          SizedBox(height: s.spaceBtwItems),

          // Title
          Text(widget.service.title, style: fonts.headlineMedium.rajdhani(fontWeight: FontWeight.bold)),
          SizedBox(height: s.paddingSm),

          // Description
          Text(
            widget.service.description,
            style: fonts.bodyMedium.rubik(color: DColors.textSecondary, height: 1.6),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: s.spaceBtwItems),

          // Divider
          Divider(color: DColors.cardBorder),
          SizedBox(height: s.paddingSm),

          // Deliverables List
          Text('Key Deliverables:', style: fonts.labelLarge.rubik(fontWeight: FontWeight.w600)),
          SizedBox(height: s.paddingSm),
          ...widget.service.deliverables!.map((item) => DeliverableItem(text: item)),
          SizedBox(height: s.spaceBtwItems),

          // Tech Stack Badges
          Wrap(
            //spacing: s.paddingSm,
            spacing: s.spaceBtwSections,
            runSpacing: s.paddingSm,
            children: widget.service.technologies!.map((tech) => TechBadge(techName: tech)).toList(),
          ),
          SizedBox(height: s.spaceBtwItems),

          // Divider
          Divider(color: DColors.cardBorder),
          SizedBox(height: s.paddingSm),

          // Price & Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Text(
                widget.service.pricing!,
                style: fonts.headlineSmall.rajdhani(color: DColors.primaryButton, fontWeight: FontWeight.bold),
              ),

              // Button
              CustomButton(
                onPressed: () {
                  // TODO: Navigate to contact page
                  debugPrint('${widget.service.title} - ${widget.service.buttonText} clicked');
                },
                tittleText: widget.service.buttonText ?? "",
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Icon Circle at Top
  Widget _buildIconCircle(DSizes s) {
    return Container(
      padding: EdgeInsets.all(s.paddingMd),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            DColors.primaryButton.withAlpha((255 * 0.2).round()),
            DColors.primaryButton.withAlpha((255 * 0.1).round()),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(widget.service.icon, color: DColors.primaryButton, size: 32),
    );
  }
}
