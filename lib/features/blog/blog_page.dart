// lib/features/blog/blog_page.dart (New File)

import 'package:flutter/material.dart';
import 'package:responsive_website/common_function/base_screen/base_screen.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // You can wrap this with BaseScreen if you have a common layout
    return const BaseScreen(
      child: Center(
        child: Text(
          'Blog Page',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}