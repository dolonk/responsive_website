import 'package:flutter/material.dart';
import 'package:responsive_website/features/blog_detail/widgets/comments/comments_section.dart';
import 'package:responsive_website/features/blog_detail/widgets/newsletter/newsletter_cta_section.dart';
import '../../utility/constants/colors.dart';
import '../../data_layer/model/blog_post_model.dart';
import 'widgets/author_bio/author_bio_section.dart';
import 'widgets/content_section/content_section.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/features/blog_detail/widgets/hero_section/blog_detail_hero.dart';

class BlogDetailPage extends StatelessWidget {
  final String postId;
  const BlogDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final post = BlogPostModel.getPostById(postId);

    return BaseScreen(
      backgroundColor: DColors.background,
      child: Column(
        children: [
          //  Hero + Post Header
          BlogDetailHero(post: post!),

          // Content
          ContentSection(post: post),

          // Author Bio
          AuthorBioSection(post: post),

          // Section 9: Comments ✅ NEW
          CommentsSection(post: post),

          // Section 10: Newsletter CTA ✅ NEW
          const NewsletterCtaSection(),
        ],
      ),
    );
  }
}
