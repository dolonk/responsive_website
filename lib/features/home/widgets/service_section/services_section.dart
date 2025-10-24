import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../data_layer/model/service_model.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:responsive_website/features/home/widgets/service_section/widget/service_card.dart';

class MyServiceSection extends StatelessWidget {
  const MyServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;
    final services = _getServices();
    final int itemsToShow = context.responsiveValue(mobile: 1, tablet: 3, desktop: 5);

    return SectionContainer(
      padding: EdgeInsets.symmetric(vertical: s.spaceBtwSections),
      child: Column(
        children: [
          // Section Title
          Text("My Services", style: fonts.displayLarge),
          SizedBox(height: s.spaceBtwItems),

          // Services Carousel
          context.isMobile
              ? _buildMobileServiceList(context, services)
              : _buildCarousel(context, services, itemsToShow),
        ],
      ),
    );
  }

  // 📱 Mobile: Vertical Scrollable List
  Widget _buildMobileServiceList(BuildContext context, List<ServiceModel> services) {
    return Column(
      children: services
          .map(
            (service) => Padding(
              padding: EdgeInsets.only(bottom: context.sizes.spaceBtwItems),
              child: ServiceCard(serviceModel: service),
            ),
          )
          .toList(),
    );
  }

  // 💻 Tablet & Desktop: Carousel Slider
  Widget _buildCarousel(BuildContext context, List<ServiceModel> services, int itemsToShow) {
    return CarouselSlider.builder(
      itemCount: services.length,
      itemBuilder: (context, index, realIndex) {
        return ServiceCard(serviceModel: services[index]);
      },
      options: CarouselOptions(
        height: context.isTablet ? 320 : 350,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 1 / itemsToShow,
        enlargeCenterPage: false,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        pauseAutoPlayOnTouch: true,
        pauseAutoPlayOnManualNavigate: true,
      ),
    );
  }

  // 📋 Service Data
  List<ServiceModel> _getServices() {
    return [
      ServiceModel(
        iconPath: "assets/home/icon/android_icon.svg",
        title: "App Development",
        subTitle: "10 projects",
        description:
            "Custom mobile applications for iOS and Android, delivering high performance and user experience.",
      ),
      ServiceModel(
        iconPath: "assets/home/icon/ios_icon.svg",
        title: "App Customizations",
        subTitle: "10 projects",
        description: "Tailored modifications and enhancements to existing mobile applications.",
      ),
      ServiceModel(
        iconPath: "assets/home/icon/web_icon.svg",
        title: "Web Development",
        subTitle: "10 projects",
        description: "Responsive web applications with modern frameworks and cutting-edge technologies.",
      ),
      ServiceModel(
        iconPath: "assets/home/icon/web_icon.svg",
        title: "UX UI Design",
        subTitle: "10 projects",
        description: "User-centered design solutions that combine aesthetics with functionality.",
      ),
      ServiceModel(
        iconPath: "assets/home/icon/web_icon.svg",
        title: "Desktop Development",
        subTitle: "10 projects",
        description: "Cross-platform desktop applications for Windows, macOS, and Linux.",
      ),
      ServiceModel(
        iconPath: "assets/home/icon/web_icon.svg",
        title: "macOS Development",
        subTitle: "10 projects",
        description: "Native macOS applications leveraging the power of Apple Silicon.",
      ),
    ];
  }
}
