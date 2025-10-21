import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../data_layer/model/project_model.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(8),
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
            // Project Image
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
                    Image.asset(widget.project.imagePath, fit: BoxFit.cover),
                    // Hover Overlay
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
            const SizedBox(height: 6),

            Text(widget.project.title, style: fonts.titleMedium),
            const SizedBox(height: 6),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.description,
                        style: fonts.labelMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: s.spaceBtwItems),

                // View Project Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isHovered ? DColors.primaryButton : DColors.cardBorder,
                    padding: EdgeInsets.all(context.responsiveValue(mobile: 10,tablet: 12, desktop: 16)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(s.borderRadiusSm)),
                  ),
                  child: Text('View Project', style: fonts.bodySmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
