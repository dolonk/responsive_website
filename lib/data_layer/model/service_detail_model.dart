import 'package:flutter/material.dart';

class ServiceDetailModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String iconPath;
  final List<String> features;
  final List<String> technologies;
  final String deliveryTime;
  final int projectsCompleted;
  final double rating;
  final List<ServiceProcess> process;

  ServiceDetailModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconPath,
    required this.features,
    required this.technologies,
    required this.deliveryTime,
    required this.projectsCompleted,
    required this.rating,
    required this.process,
  });
}

/// 🔄 Service Process Step
class ServiceProcess {
  final String title;
  final String description;
  final String icon;

  ServiceProcess({required this.title, required this.description, required this.icon});
}

/// 📊 Service Statistics
class ServiceStats {
  final String label;
  final String value;
  final IconData icon;

  ServiceStats({required this.label, required this.value, required this.icon});
}

/// 🎯 Service Category
enum ServiceCategory {
  appDevelopment,
  webDevelopment,
  uiUxDesign,
  desktopDevelopment,
  consulting,
  maintenance,
}
