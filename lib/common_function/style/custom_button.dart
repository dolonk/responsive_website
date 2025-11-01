import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';
import '../../utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double height;
  final String tittleText;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.tittleText,
    required this.onPressed,
    this.width,
    this.height = 50,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: context.isMobile ?context.sizes.paddingMd:0),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered ? DColors.cardBorder : DColors.primaryButton,
            side: BorderSide(color: DColors.buttonBorder, width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.sizes.borderRadiusSm)),
          ),
          child: Text(widget.tittleText, style: context.fonts.bodySmall),
        ),
      ),
    );
  }
}
