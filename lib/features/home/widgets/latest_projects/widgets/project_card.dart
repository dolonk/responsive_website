import 'package:flutter/material.dart';
import '../../../../../common_function/style/hoverable_card.dart';
import '../../../../../utility/constants/colors.dart';
import '../../../../../data_layer/model/project_model.dart';
import '../../../../../common_function/style/custom_button.dart';
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

    return HoverableCard(
      padding: EdgeInsets.all(8),
      backgroundColor: DColors.cardBackground,
      borderRadius: BorderRadius.circular(s.borderRadiusMd),
      onHoverChanged: (isHovered) => setState(() => _isHovered = isHovered),
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
                  AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    scale: _isHovered ? 1.1 : 1.0,
                    child: Image.asset(
                      widget.project.imagePath,
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
          const SizedBox(height: 6),

          Text(widget.project.title, style: fonts.titleMedium),
          const SizedBox(height: 6),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  widget.project.description,
                  style: fonts.labelMedium.rubik(color: DColors.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: s.spaceBtwItems),
              CustomButton(height: 40, tittleText: 'View Project', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
