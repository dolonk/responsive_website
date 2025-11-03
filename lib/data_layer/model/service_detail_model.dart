import 'package:flutter/material.dart';

class ServiceDetailModel {
  final String id;
  final String title;
  final String? subtitle;
  final String description;
  final String? iconPath;
  final List<String>? features;
  final List<String>? technologies;
  final String? deliveryTime;
  final int? projectsCompleted;
  final double? rating;
  final List<ServiceProcess>? process;
  final IconData? icon;
  final List<String>? deliverables;
  final String? pricing;
  final String? buttonText;

  ServiceDetailModel({
    required this.id,
    required this.title,
    this.subtitle,
    required this.description,
    this.iconPath,
    this.features,
    this.technologies,
    this.deliveryTime,
    this.projectsCompleted,
    this.rating,
    this.process,
    this.icon,
    this.deliverables,
    this.pricing,
    this.buttonText,
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
enum ServiceCategory { appDevelopment, webDevelopment, uiUxDesign, desktopDevelopment, consulting, maintenance }
