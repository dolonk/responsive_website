import 'package:flutter/material.dart';

class ContactInfoModel {
  final String title;
  final String value;
  final String description;
  final IconData icon;
  final Color accentColor;
  final VoidCallback? onTap;

  ContactInfoModel({
    required this.title,
    required this.value,
    required this.description,
    required this.icon,
    required this.accentColor,
    this.onTap,
  });
}
