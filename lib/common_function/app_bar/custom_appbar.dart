import 'package:flutter/material.dart';
import '../../utility/default_sizes/default_sizes.dart';
import '../../utility/responsive/responsive_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'My Portfolio',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: DSizes.fontSizeLg),
      ),
      actions: DeviceType.isMobile
          ? null
          : ['Home', 'About', 'Services', 'Projects', 'Contact']
                .map(
                  (item) => TextButton(
                    onPressed: () => _onMenuItemTap(item),
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.black87, fontSize: DSizes.fontSizeMd),
                    ),
                  ),
                )
                .toList(),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  void _onMenuItemTap(String item) {
    print('Tapped: $item');
    // এখানে তুমি navigation logic add করতে পারবে
  }
}
