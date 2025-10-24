import 'package:flutter/material.dart';
import '../../../../../../utility/constants/colors.dart';
import '../../../../../../data_layer/model/blog_model.dart';
import '../../../../../../utility/default_sizes/font_size.dart';
import '../../../../../../utility/default_sizes/default_sizes.dart';
import '../../../../../common_function/style/custom_button.dart';
import '../../../../../common_function/style/hoverable_card.dart';

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

    return HoverableCard(
      padding: const EdgeInsets.all(8),
      backgroundColor: DColors.cardBackground,
      borderRadius: BorderRadius.circular(s.borderRadiusMd),
      onHoverChanged: (isHovered) => setState(() => _isHovered = isHovered),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section (same as before but with cache)
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
                  AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    scale: _isHovered ? 1.1 : 1.0,
                    child: Image.asset(
                      widget.blog.imagePath,
                      fit: BoxFit.cover,
                      cacheHeight: 400,
                      cacheWidth: 400,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, DColors.primaryButton.withAlpha((255 * 0.6).round())],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: s.paddingSm),

          // Content (rest remains same)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: s.paddingXs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categories
                Text(widget.blog.category, style: fonts.bodySmall.rubik(color: DColors.primaryButton)),
                SizedBox(height: s.spaceBtwItems / 2),

                // Tittle
                Text(
                  widget.blog.title,
                  style: fonts.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: s.spaceBtwItems / 2),

                // Description
                Text(
                  widget.blog.description,
                  style: fonts.labelMedium.rubik(color: DColors.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: s.spaceBtwItems),

                // Button
                CustomButton(width: double.infinity, height: 40, tittleText: 'Read More', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
