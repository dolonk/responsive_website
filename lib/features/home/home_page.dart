import 'package:flutter/material.dart';
import '../../common_function/app_bar/custom_appbar.dart';
import '../../common_function/style/custom_button.dart';
import '../../common_function/style/custom_card.dart';
import '../../utility/responsive/responsive_helper.dart';
import '../../utility/responsive/responsive_widget.dart';
import '../../utility/responsive/section_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: context.isMobile
          ? Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  ..._buildDrawerItems(),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            SectionContainer(
              backgroundColor: Colors.blue[50],
              child: ResponsiveWidget(mobile: _buildHeroMobile(), desktop: _buildHeroDesktop()),
            ),

            // Services Section
            SectionContainer(
              child: Column(
                children: [
                  const Text('Our Services', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  ResponsiveWidget(mobile: _buildServicesMobile(), desktop: _buildServicesDesktop()),
                ],
              ),
            ),

            // Footer
            SectionContainer(
              backgroundColor: Colors.grey[900],
              child: Text(
                '© 2024 My Website. All rights reserved.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    return ['Home', 'About', 'Services', 'Contact']
        .map(
          (item) => ListTile(
            title: Text(item),
            onTap: () {
              print('Drawer tapped: $item');
            },
          ),
        )
        .toList();
  }

  Widget _buildHeroMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Welcome to Our Website',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Build amazing responsive websites with Flutter',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        CustomButton(text: 'Get Started', onPressed: () {}, width: double.infinity),
      ],
    );
  }

  Widget _buildHeroDesktop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Our Website',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Build amazing responsive websites with Flutter',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              const SizedBox(height: 30),
              CustomButton(text: 'Get Started', onPressed: () {}, width: 200),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: Container(
            height: 400,
            decoration: BoxDecoration(color: Colors.blue[200], borderRadius: BorderRadius.circular(12)),
            child: const Center(child: Icon(Icons.image, size: 100, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildServicesMobile() {
    return Column(
      children: [
        CustomCard(
          icon: Icons.design_services,
          title: 'Web Design',
          description: 'Beautiful and modern website designs',
          onTap: () {},
        ),
        const SizedBox(height: 20),
        CustomCard(
          icon: Icons.code,
          title: 'Development',
          description: 'Clean and efficient code',
          onTap: () {},
        ),
        const SizedBox(height: 20),
        CustomCard(
          icon: Icons.phone_android,
          title: 'Mobile Apps',
          description: 'Cross-platform mobile applications',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildServicesDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomCard(
            icon: Icons.design_services,
            title: 'Web Design',
            description: 'Beautiful and modern website designs',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomCard(
            icon: Icons.code,
            title: 'Development',
            description: 'Clean and efficient code',
            onTap: () {},
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomCard(
            icon: Icons.phone_android,
            title: 'Mobile Apps',
            description: 'Cross-platform mobile applications',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
