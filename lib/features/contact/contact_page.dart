import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';
import 'package:responsive_website/common_function/style/custom_button.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import 'package:responsive_website/utility/responsive/responsive_widget.dart';
import 'package:responsive_website/utility/responsive/section_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: DColors.secondaryBackground,
      child: Column(
        children: [
          _buildHeroSection(context),
          _buildContactSection(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return SectionContainer(
      backgroundColor: DColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: s.paddingLg,
        vertical: s.spaceBtwSections * 2,
      ),
      child: Column(
        children: [
          // Breadcrumb
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.go('/'),
                child: Text('Home', style: fonts.bodyMedium.rubik(color: DColors.textSecondary)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.chevron_right, size: 16, color: DColors.textSecondary),
              ),
              Text(
                'Contact',
                style: fonts.bodyMedium.rubik(color: DColors.primaryButton, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: s.spaceBtwItems),

          Text(
            'Get In Touch',
            style: fonts.displayLarge.rajdhani(
              fontSize: context.responsiveValue(mobile: 40, tablet: 56, desktop: 64),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: s.paddingMd),

          SizedBox(
            width: context.responsiveValue(mobile: double.infinity, tablet: 600, desktop: 700),
            child: Text(
              'Have a project in mind? Let\'s work together to bring your ideas to life',
              style: fonts.bodyLarge.rubik(color: DColors.textSecondary, height: 1.6),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    final s = context.sizes;

    return SectionContainer(
      padding: EdgeInsets.symmetric(
        horizontal: s.paddingMd,
        vertical: s.spaceBtwSections,
      ),
      child: ResponsiveWidget(
        mobile: Column(
          children: [
            _buildContactInfo(context),
            SizedBox(height: s.spaceBtwSections),
            _buildContactForm(context),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildContactForm(context)),
            SizedBox(width: s.spaceBtwSections),
            Expanded(flex: 1, child: _buildContactInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      padding: EdgeInsets.all(context.responsiveValue(mobile: s.paddingMd, desktop: s.paddingLg)),
      decoration: BoxDecoration(
        color: DColors.cardBackground,
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.cardBorder, width: 1.5),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send us a message', style: fonts.headlineMedium),
            SizedBox(height: s.spaceBtwItems),

            // Name Field
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
            ),
            SizedBox(height: s.spaceBtwItems),

            // Email Field
            _buildTextField(
              controller: _emailController,
              label: 'Your Email',
              hint: 'john@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Please enter your email';
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: s.spaceBtwItems),

            // Message Field
            _buildTextField(
              controller: _messageController,
              label: 'Your Message',
              hint: 'Tell us about your project...',
              maxLines: 5,
              validator: (value) => value?.isEmpty ?? true ? 'Please enter your message' : null,
            ),
            SizedBox(height: s.spaceBtwSections),

            // Submit Button
            CustomButton(
              width: double.infinity,
              height: 50,
              tittleText: 'Send Message',
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: fonts.bodyMedium.rubik(fontWeight: FontWeight.w500)),
        SizedBox(height: s.paddingSm),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: fonts.bodyMedium.rubik(color: DColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: fonts.bodySmall.rubik(color: DColors.textSecondary),
            filled: true,
            fillColor: DColors.secondaryBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(s.borderRadiusSm),
              borderSide: BorderSide(color: DColors.cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(s.borderRadiusSm),
              borderSide: BorderSide(color: DColors.cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(s.borderRadiusSm),
              borderSide: BorderSide(color: DColors.primaryButton, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(s.borderRadiusSm),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: EdgeInsets.all(s.paddingMd),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Container(
      padding: EdgeInsets.all(context.responsiveValue(mobile: s.paddingMd, desktop: s.paddingLg)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [DColors.primaryButton.withOpacity(0.1), DColors.primaryButton.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(s.borderRadiusLg),
        border: Border.all(color: DColors.primaryButton.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact Information', style: fonts.headlineMedium),
          SizedBox(height: s.spaceBtwItems),

          _buildInfoItem(
            context,
            icon: Icons.email_rounded,
            title: 'Email',
            value: 'hello@buildstorm.dev',
          ),
          SizedBox(height: s.spaceBtwItems),

          _buildInfoItem(
            context,
            icon: Icons.phone_rounded,
            title: 'Phone',
            value: '+880 12345 6479',
          ),
          SizedBox(height: s.spaceBtwItems),

          _buildInfoItem(
            context,
            icon: Icons.location_on_rounded,
            title: 'Location',
            value: 'Dhaka, Bangladesh',
          ),
          SizedBox(height: s.spaceBtwSections),

          // Social Media
          Text('Follow Us', style: fonts.titleMedium),
          SizedBox(height: s.spaceBtwItems),

          Row(
            children: [
              _buildSocialIcon(FontAwesomeIcons.linkedin),
              _buildSocialIcon(FontAwesomeIcons.github),
              _buildSocialIcon(FontAwesomeIcons.twitter),
              _buildSocialIcon(FontAwesomeIcons.instagram),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String value,
      }) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(s.paddingSm),
          decoration: BoxDecoration(
            color: DColors.primaryButton.withOpacity(0.1),
            borderRadius: BorderRadius.circular(s.borderRadiusSm),
          ),
          child: Icon(icon, color: DColors.primaryButton, size: 20),
        ),
        SizedBox(width: s.spaceBtwItems),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: fonts.labelMedium.rubik(color: DColors.textSecondary),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: fonts.bodyMedium.rubik(fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    final s = context.sizes;

    return Padding(
      padding: EdgeInsets.only(right: s.paddingMd),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            debugPrint('Social icon tapped');
          },
          child: Container(
            padding: EdgeInsets.all(s.paddingSm),
            decoration: BoxDecoration(
              color: DColors.cardBackground,
              borderRadius: BorderRadius.circular(s.borderRadiusSm),
              border: Border.all(color: DColors.cardBorder),
            ),
            child: Icon(icon, color: DColors.textPrimary, size: 20),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Message sent successfully!',
            style: context.fonts.bodyMedium,
          ),
          backgroundColor: DColors.primaryButton,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }
}