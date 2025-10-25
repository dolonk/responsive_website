import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_website/utility/constants/colors.dart';
import 'package:responsive_website/utility/default_sizes/font_size.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

/*class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
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
          ? Text('Build Storm', style: context.fonts.displayMedium)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Home', 'About', 'Services', 'Projects', 'Contact']
                  .map(
                    (item) => TextButton(
                      onPressed: () => _onMenuItemTap(item),
                      child: Text(item, style: context.fonts.bodySmall),
                    ),
                  )
                  .toList(),
            ),
    );
  }

  void _onMenuItemTap(String item) {
    print('Tapped: $item');
  }
}*/

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    // Get current route
    final currentRoute = GoRouterState.of(context).uri.path;

    return AppBar(
      elevation: 0,
      backgroundColor: DColors.background,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: context.isMobile
          ? GestureDetector(
              onTap: () => context.go('/'),
              child: Text('Build Storm', style: context.fonts.displayMedium),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AppBarMenuItem(title: 'Home', isActive: currentRoute == '/', onTap: () => context.go('/')),
                _AppBarMenuItem(
                  title: 'About',
                  isActive: currentRoute == '/about',
                  onTap: () => context.go('/about'),
                ),
                _AppBarMenuItem(
                  title: 'Services',
                  isActive: currentRoute == '/services',
                  onTap: () => context.go('/services'),
                ),
                _AppBarMenuItem(
                  title: 'Projects',
                  isActive: currentRoute == '/projects',
                  onTap: () => context.go('/projects'),
                ),
                _AppBarMenuItem(
                  title: 'Contact',
                  isActive: currentRoute == '/contact',
                  onTap: () => context.go('/contact'),
                ),
              ],
            ),
    );
  }
}

/// 📌 AppBar Menu Item with hover effect and active state
class _AppBarMenuItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _AppBarMenuItem({required this.title, required this.isActive, required this.onTap});

  @override
  State<_AppBarMenuItem> createState() => _AppBarMenuItemState();
}

class _AppBarMenuItemState extends State<_AppBarMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive
                    ? DColors.primaryButton
                    : _isHovered
                    ? DColors.primaryButton.withOpacity(0.5)
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: fonts.bodySmall.copyWith(
              color: widget.isActive
                  ? DColors.primaryButton
                  : _isHovered
                  ? DColors.textPrimary
                  : DColors.textSecondary,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
