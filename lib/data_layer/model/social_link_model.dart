import 'package:flutter/material.dart';

class SocialLinkModel {
  final String platform;
  final String url;
  final IconData icon;
  final Color color;

  SocialLinkModel({
    required this.platform,
    required this.url,
    required this.icon,
    required this.color,
  });
}