import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/data_layer/model/blog_model.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/blog_section/widgets/blog_card.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      padding: EdgeInsets.all(s.paddingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Subtitle
          Text('Blog & News', style: fonts.bodyLarge.rubik(color: DColors.primaryButton)),
          SizedBox(height: s.paddingSm),

          // Title
          Text('Blogs About Creativity', style: fonts.displayLarge, textAlign: TextAlign.center),
          SizedBox(height: s.spaceBtwSections),

          // Blogs Grid
          _buildBlogsGrid(context),
        ],
      ),
    );
  }

  // 📋 GET BLOGS DATA
  List<BlogModel> _getBlogsData() {
    return [
      BlogModel(
        title: "The Art of Minimalist Web Design",
        category: "Web Design",
        description:
            "Discover how less can be more. Tips and tricks for creating stunning, minimalist websites.",
        imagePath: "assets/home/projects/project_1.png",
      ),
      BlogModel(
        title: "Mobile App UX: A Deep Dive",
        category: "UX/UI",
        description:
            "Exploring the key principles of user experience that make mobile apps successful and intuitive.",
        imagePath: "assets/home/projects/project_2.png",
      ),
      BlogModel(
        title: "Branding in the Digital Age",
        category: "Marketing",
        description: "How to build a compelling brand identity that resonates with today's online audience.",
        imagePath: "assets/home/projects/project_3.png",
      ),
    ];
  }

  // 📝 BLOGS GRID
  Widget _buildBlogsGrid(BuildContext context) {
    final s = context.sizes;
    final blogs = _getBlogsData();
    final crossAxisCount = context.responsiveValue(mobile: 1, tablet: 2, desktop: 3);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s.paddingMd),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: blogs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: s.spaceBtwSections,
          mainAxisSpacing: s.spaceBtwSections,
          childAspectRatio: context.responsiveValue(mobile: 0.7, tablet: 0.8, desktop: 0.85),
        ),
        itemBuilder: (context, index) => BlogCard(blog: blogs[index]),
      ),
    );
  }
}
