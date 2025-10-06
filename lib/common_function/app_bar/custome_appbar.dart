import 'package:flutter/material.dart';
import '../../utility/responsive/responsive_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> menuItems;
  final Function(String)? onMenuItemTap;

  const CustomAppBar({super.key, required this.title, required this.menuItems, this.onMenuItemTap});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      actions: DeviceType.isMobile
          ? null
          : menuItems
                .map(
                  (item) => TextButton(
                    onPressed: () => onMenuItemTap?.call(item),
                    child: Text(item, style: const TextStyle(color: Colors.black87, fontSize: 16)),
                  ),
                )
                .toList(),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
