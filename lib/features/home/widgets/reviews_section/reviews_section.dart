import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import '../../../../data_layer/model/reviews_model.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/features/home/widgets/reviews_section/widgets/reviews_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});
  List<ReviewsModel> _getReviewsData() {
    return [
      ReviewsModel(
        name: "UJJOL KD",
        role: "Startup Founder of Dayzo",
        rating: 5,
        imagePath: "assets/home/icon/sul.png",
        quote:
            "Working with this team was a game changer. They delivered a fully functional iOS and Android app ahead of schedule with flawless performance. The communication was clear and responsive throughout the process.",
      ),
      ReviewsModel(
        name: "Mir Sultan",
        role: "Startup Founder of Space IT",
        rating: 5,
        imagePath: "assets/home/icon/sul.png",
        quote:
            "Working with this developer was a game changer. The communication was clear and responsive throughout the process. Highly recommended!",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections, horizontal: s.paddingLg),
      child: Container(
        decoration: BoxDecoration(gradient: DColors.reviewsSectionGradient),
        child: ResponsiveWidget(
          mobile: _buildMobileLayout(context),
          tablet: _buildTabletLayout(context),
          desktop: _buildDesktopLayout(context),
        ),
      ),
    );
  }

  // 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context),
        SizedBox(height: s.spaceBtwSections),
        _buildReviewsCards(context, isMobile: true),
      ],
    );
  }

  // 📱 Tablet Layout
  Widget _buildTabletLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context),
        SizedBox(height: s.spaceBtwSections),
        _buildReviewsCards(context, isMobile: false),
      ],
    );
  }

  // 💻 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    final s = context.sizes;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildSectionHeader(context)),
            SizedBox(width: s.spaceBtwItems16),

            Expanded(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: -100,
                    bottom: -90,
                    child: Container(
                      width: 250,
                      height: 240,
                      decoration: BoxDecoration(shape: BoxShape.circle, gradient: DColors.pinkGradient),
                    ),
                  ),

                  _buildReviewsCards(context, isMobile: false),

                  Positioned(
                    top: -34,
                    left: 0,
                    child: SvgPicture.asset(
                      "assets/home/icon/quotes.svg",
                      width: 60,
                      height: 60,
                      colorFilter: ColorFilter.mode(DColors.primaryButton, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: context.sizes.paddingMd * 2.5),
      ],
    );
  }

  // 📋 SECTION HEADER
  Widget _buildSectionHeader(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Column(
      crossAxisAlignment: context.isMobile || context.isTablet
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Subtitle
        Text("Reviews", style: fonts.headlineMedium.rajdhani(color: DColors.primaryButton)),
        SizedBox(height: s.paddingSm),

        // Title
        RichText(
          text: TextSpan(
            style: fonts.displayLarge,
            children: [
              const TextSpan(text: "What Clients "),
              TextSpan(
                text: "Say",
                style: TextStyle(color: DColors.primaryButton),
              ),
            ],
          ),
        ),
        SizedBox(height: s.spaceBtwItems),

        // Description
        SizedBox(
          width: context.isDesktop ? 350 : double.infinity,
          child: Text(
            "Android app ahead of schedule with flawless performance. The communication was clear and responsive throughout.",
            style: fonts.labelLarge.rajdhani(color: DColors.textSecondary, height: 1.6),
            maxLines: 4,
            textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // 🎴 Reviews CARDS
  Widget _buildReviewsCards(BuildContext context, {required bool isMobile}) {
    final s = context.sizes;
    final reviews = _getReviewsData();

    if (isMobile) {
      return Column(
        children: reviews
            .map(
              (review) => Padding(
                padding: EdgeInsets.only(bottom: s.spaceBtwItems),
                child: ReviewsCard(reviews: review),
              ),
            )
            .toList(),
      );
    }

    return CarouselSlider.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index, realIndex) {
        final review = reviews[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ReviewsCard(reviews: review),
        );
      },
      options: CarouselOptions(
        height: context.isTablet ? 220 : 246,
        padEnds: false,
        autoPlay: true,
        enlargeFactor: 0.3,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        scrollPhysics: NeverScrollableScrollPhysics(),
        pauseAutoPlayOnTouch: true,
        pauseAutoPlayOnManualNavigate: true,
      ),
    );
  }
}
