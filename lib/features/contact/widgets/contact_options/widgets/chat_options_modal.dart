import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatOptionsModal extends StatelessWidget {
  const ChatOptionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return Dialog(
      backgroundColor: Colors.transparent,
      child:
          Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: DColors.cardBackground,
                  borderRadius: BorderRadius.circular(s.borderRadiusLg),
                  border: Border.all(color: DColors.cardBorder, width: 2),
                ),
                padding: EdgeInsets.all(s.paddingLg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Chat Platform',
                          style: fonts.headlineSmall.rajdhani(
                            fontWeight: FontWeight.bold,
                            color: DColors.textPrimary,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close_rounded),
                          color: DColors.textSecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: s.spaceBtwItems),

                    // WhatsApp Button
                    _ChatOptionButton(
                      icon: FontAwesomeIcons.whatsapp,
                      label: 'WhatsApp',
                      color: const Color(0xFF25D366),
                      onTap: () {
                        _launchWhatsApp();
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: s.paddingMd),

                    // Telegram Button
                    _ChatOptionButton(
                      icon: FontAwesomeIcons.telegram,
                      label: 'Telegram',
                      color: const Color(0xFF0088CC),
                      onTap: () {
                        _launchTelegram();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
              .animate()
              .scale(begin: const Offset(0.8, 0.8), duration: 300.ms, curve: Curves.easeOutBack)
              .fadeIn(duration: 300.ms),
    );
  }

  /// Launch WhatsApp
  void _launchWhatsApp() async {
    // Replace with your actual WhatsApp number
    final Uri whatsappUrl = Uri.parse('https://wa.me/8801XXXXXXXXX?text=Hello!');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch WhatsApp');
    }
  }

  /// Launch Telegram
  void _launchTelegram() async {
    // Replace with your actual Telegram username
    final Uri telegramUrl = Uri.parse('https://t.me/your_username');

    if (await canLaunchUrl(telegramUrl)) {
      await launchUrl(telegramUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch Telegram');
    }
  }
}

/// Chat Option Button Widget
class _ChatOptionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ChatOptionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ChatOptionButton> createState() => _ChatOptionButtonState();
}

class _ChatOptionButtonState extends State<_ChatOptionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final s = context.sizes;
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: s.paddingMd, horizontal: s.paddingLg),
          decoration: BoxDecoration(
            color: _isHovered ? widget.color.withAlpha((255 * 0.15).round()) : DColors.secondaryBackground,
            borderRadius: BorderRadius.circular(s.borderRadiusMd),
            border: Border.all(color: _isHovered ? widget.color : DColors.cardBorder, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(widget.icon, color: widget.color, size: 24),
              SizedBox(width: s.paddingMd),
              Text(
                widget.label,
                style: fonts.bodyLarge.rubik(
                  color: _isHovered ? widget.color : DColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
