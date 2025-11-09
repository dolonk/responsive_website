import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/data_layer/model/contact_info_model.dart';

class ContactInfoCard extends StatefulWidget {
  final ContactInfoModel info;

  const ContactInfoCard({super.key, required this.info});

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    final isClickable = widget.info.onTap != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.info.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(_isHovered && isClickable ? 1.02 : 1.0),
          decoration: BoxDecoration(
            color: DColors.cardBackground,
            borderRadius: BorderRadius.circular(s.borderRadiusLg),
            border: Border.all(
              color: _isHovered && isClickable
                  ? widget.info.accentColor.withAlpha((255 * 0.5).round())
                  : DColors.cardBorder,
              width: _isHovered && isClickable ? 2 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered && isClickable
                    ? widget.info.accentColor.withAlpha((255 * 0.2).round())
                    : Colors.black.withAlpha((255 * 0.05).round()),
                blurRadius: _isHovered && isClickable ? 20 : 8,
                offset: Offset(0, _isHovered && isClickable ? 8 : 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(s.paddingMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon with colored background
            Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(color: widget.info.accentColor.withAlpha((255 * 0.15).round()), shape: BoxShape.circle),
            child: Icon(widget.info.icon, size: 36, color: widget.info.accentColor),
          ),
              SizedBox(height: s.spaceBtwItems),

              // Title
              Text(
                widget.info.title,
                style: fonts.headlineSmall.rajdhani(fontWeight: FontWeight.bold, color: DColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: s.paddingSm),

              // Value (Email/Phone/Location)
              Text(
                widget.info.value,
                style: fonts.bodyMedium.rubik(color: widget.info.accentColor, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: s.paddingSm),

              // Description
              Text(
                widget.info.description,
                style: fonts.bodySmall.rubik(color: DColors.textSecondary, height: 1.5),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
