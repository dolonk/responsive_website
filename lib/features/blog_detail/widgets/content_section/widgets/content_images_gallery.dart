import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class ContentImagesGallery extends StatefulWidget {
  final List<String> imagePaths;

  const ContentImagesGallery({super.key, required this.imagePaths});

  @override
  State<ContentImagesGallery> createState() => _ContentImagesGalleryState();
}

class _ContentImagesGalleryState extends State<ContentImagesGallery> {
  int? _selectedImageIndex;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      margin: EdgeInsets.symmetric(vertical: s.spaceBtwItems),
      padding: EdgeInsets.all(s.paddingLg),
      decoration: BoxDecoration(
        color: DColors.cardBackground,
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(Icons.image_rounded, color: DColors.primaryButton, size: 24),
              SizedBox(width: s.paddingSm),
              Text(
                'Article Images',
                style: fonts.titleMedium.rajdhani(fontWeight: FontWeight.bold, color: DColors.textPrimary),
              ),
              SizedBox(width: s.paddingSm),
              Text('(${widget.imagePaths.length})', style: fonts.bodySmall.rubik(color: DColors.textSecondary)),
            ],
          ),
          SizedBox(height: s.paddingMd),

          // Images Grid
          _buildImagesGrid(s),

          // Lightbox
          if (_selectedImageIndex != null) _buildLightbox(context),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 700.ms).slideY(begin: 0.1, duration: 600.ms, delay: 700.ms);
  }

  Widget _buildImagesGrid(DSizes s) {
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 2, desktop: 2);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: s.paddingMd,
        mainAxisSpacing: s.paddingMd,
        childAspectRatio: 16 / 9,
      ),
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index) {
        return _ImageThumbnail(
          imagePath: widget.imagePaths[index],
          index: index,
          onTap: () => setState(() => _selectedImageIndex = index),
        );
      },
    );
  }

  Widget _buildLightbox(BuildContext context) {
    final currentImagePath = widget.imagePaths[_selectedImageIndex!];
    final fonts = context.fonts;
    final s = context.sizes;

    return GestureDetector(
      onTap: () => setState(() => _selectedImageIndex = null),
      child: Container(
        color: Colors.black.withAlpha((255 * 0.95).round()),
        child: Stack(
          children: [
            // Full screen image with zoom
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.asset(
                  currentImagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image_outlined, size: 80, color: Colors.white54),
                          SizedBox(height: 16),
                          Text('Image not found', style: fonts.bodyMedium.rubik(color: Colors.white54)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Close button
            Positioned(
              top: 40,
              right: 40,
              child: _buildLightboxButton(
                icon: Icons.close_rounded,
                onTap: () => setState(() => _selectedImageIndex = null),
              ),
            ),

            // Previous button (if not first)
            if (_selectedImageIndex! > 0)
              Positioned(
                left: 40,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildLightboxButton(
                    icon: Icons.arrow_back_ios_rounded,
                    onTap: () => setState(() => _selectedImageIndex = _selectedImageIndex! - 1),
                  ),
                ),
              ),

            // Next button (if not last)
            if (_selectedImageIndex! < widget.imagePaths.length - 1)
              Positioned(
                right: 40,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _buildLightboxButton(
                    icon: Icons.arrow_forward_ios_rounded,
                    onTap: () => setState(() => _selectedImageIndex = _selectedImageIndex! + 1),
                  ),
                ),
              ),

            // Image counter
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: s.paddingMd, horizontal: s.paddingLg),
                color: Colors.black.withAlpha((255 * 0.7).round()),
                child: Text(
                  'Image ${_selectedImageIndex! + 1} of ${widget.imagePaths.length}',
                  style: fonts.bodyMedium.rubik(color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ).animate().fadeIn(duration: 300.ms),
    );
  }

  Widget _buildLightboxButton({required IconData icon, required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DColors.primaryButton,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: DColors.primaryButton.withAlpha((255 * 0.5).round()),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}

class _ImageThumbnail extends StatefulWidget {
  final String imagePath;
  final int index;
  final VoidCallback onTap;

  const _ImageThumbnail({required this.imagePath, required this.index, required this.onTap});

  @override
  State<_ImageThumbnail> createState() => _ImageThumbnailState();
}

class _ImageThumbnailState extends State<_ImageThumbnail> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
            border: Border.all(
              color: _isHovered ? DColors.primaryButton : DColors.cardBorder,
              width: _isHovered ? 2 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: DColors.primaryButton.withAlpha((255 * 0.3).round()),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image
                Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: DColors.cardBackground,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.broken_image_outlined, size: 40, color: DColors.textSecondary),
                            SizedBox(height: 8),
                            Text(
                              'Image ${widget.index + 1}',
                              style: fonts.bodySmall.rubik(color: DColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Overlay on hover
                if (_isHovered)
                  Container(
                    color: Colors.black.withAlpha((255 * 0.4).round()),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(s.paddingMd),
                        decoration: BoxDecoration(color: DColors.primaryButton, shape: BoxShape.circle),
                        child: Icon(Icons.zoom_in_rounded, color: Colors.white, size: 32),
                      ),
                    ),
                  ).animate().fadeIn(duration: 200.ms),

                // Image number badge
                Positioned(
                  top: s.paddingSm,
                  left: s.paddingSm,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: s.paddingSm, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha((255 * 0.7).round()),
                      borderRadius: BorderRadius.circular(s.borderRadiusSm),
                    ),
                    child: Text(
                      '${widget.index + 1}',
                      style: fonts.labelSmall.rubik(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
