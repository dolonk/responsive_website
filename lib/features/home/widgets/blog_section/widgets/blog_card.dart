import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import '../../../../../../utility/constants/colors.dart';
import '../../../../../../data_layer/model/blog_model.dart';
import '../../../../../../utility/default_sizes/font_size.dart';
import '../../../../../../utility/default_sizes/default_sizes.dart';

class BlogCard extends StatefulWidget {
  final BlogModel blog;

  const BlogCard({super.key, required this.blog});

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: DColors.cardBackground,
          borderRadius: BorderRadius.circular(s.borderRadiusMd),
          border: Border.all(color: _isHovered ? DColors.primaryButton : Colors.transparent, width: 2),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: DColors.primaryButton.withAlpha((255 * 0.2).round()),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image with Hover Overlay
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(s.borderRadiusMd - 2),
                  topRight: Radius.circular(s.borderRadiusMd - 2),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(widget.blog.imagePath, fit: BoxFit.cover),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isHovered ? 1.0 : 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              DColors.primaryButton.withAlpha((255 * 0.6).round()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: s.paddingSm),

            // Blog Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: s.paddingXs),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.blog.category, style: fonts.bodySmall.rubik(color: DColors.primaryButton)),
                  SizedBox(height: s.spaceBtwItems / 2),

                  Text(
                    widget.blog.title,
                    style: fonts.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: s.spaceBtwItems / 2),

                  Text(
                    widget.blog.description,
                    style: fonts.labelMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: s.spaceBtwItems),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHovered ? DColors.primaryButton : DColors.cardBorder,
                        padding: EdgeInsets.all(context.responsiveValue(mobile: 10, tablet: 12, desktop: 16)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
                      ),
                      child: Text('Read More', style: fonts.bodySmall),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
