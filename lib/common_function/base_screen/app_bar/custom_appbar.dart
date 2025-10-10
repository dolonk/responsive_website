import 'package:flutter/material.dart';
import '../../../utility/default_sizes/default_sizes.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final s = DSizes.of(context);
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: context.isMobile
          ? Text(
              'My Portfolio',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: s.bodyLarge),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side - Logo/Title
                Text(
                  'My Portfolio',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: s.bodyLarge),
                ),
                // Center - Menu items
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: ['Home', 'About', 'Services', 'Projects', 'Contact']
                      .map(
                        (item) => TextButton(
                          onPressed: () => _onMenuItemTap(item),
                          child: Text(
                            item,
                            style: TextStyle(color: Colors.black87, fontSize: s.bodyLarge),
                          ),
                        ),
                      )
                      .toList(),
                ),
                // Right side - Spacer for balance
                const SizedBox(width: 100),
              ],
            ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  void _onMenuItemTap(String item) {
    print('Tapped: $item');
    // এখানে navigation logic add করবে
  }
}
