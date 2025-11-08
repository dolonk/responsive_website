import 'package:flutter/material.dart';

class ContactOptionModel {
  final String title;
  final String description;
  final IconData icon;
  final String actionText;
  final VoidCallback onTap;
  final Color accentColor;

  ContactOptionModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.actionText,
    required this.onTap,
    required this.accentColor,
  });
}
