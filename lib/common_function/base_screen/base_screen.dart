import 'footer/custom_footer.dart';
import 'app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_website/utility/responsive/responsive_helper.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool? extendBody;
  final bool? extendBodyBehindAppBar;
  final Color? backgroundColor;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const BaseScreen({
    super.key,
    required this.child,
    this.extendBody,
    this.extendBodyBehindAppBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: extendBody ?? false,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: const CustomAppBar(),
      drawer: context.isMobile
          ? Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ..._drawerItems(),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            child,
            const FooterSection(),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  List<Widget> _drawerItems() => ['Home', 'About', 'Services', 'Projects', 'Contact']
      .map(
        (e) => ListTile(
      title: Text(e),
      onTap: () => print('Drawer $e tapped'),
    ),
  )
      .toList();
}
