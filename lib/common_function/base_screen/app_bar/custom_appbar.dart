import 'package:flutter/material.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: DColors.background,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: context.isMobile
          ? Text('My Portfolio', style: context.fonts.displayMedium)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side - Logo/Title
                Text('My Portfolio', style: context.fonts.bodyLarge),
                // Center - Menu items
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: ['Home', 'About', 'Services', 'Projects', 'Contact']
                      .map(
                        (item) => TextButton(
                          onPressed: () => _onMenuItemTap(item),
                          child: Text(item, style: context.fonts.bodyLarge),
                        ),
                      )
                      .toList(),
                ),
                // Right side - Spacer for balance
                //const SizedBox(width: 100),
              ],
            ),
    );
  }

  void _onMenuItemTap(String item) {
    print('Tapped: $item');
    // এখানে navigation logic add করবে
  }
}
