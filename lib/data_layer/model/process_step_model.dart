import 'package:flutter/material.dart';

class ProcessStepModel {
  final String title;
  final String description;
  final IconData icon;
  final int stepNumber;

  ProcessStepModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.stepNumber,
  });
}