
class StatModel {
  final String label;
  final int value;
  final String suffix; // +, %, K+ etc
  final String icon; // Icon name or path

  StatModel({
    required this.label,
    required this.value,
    required this.suffix,
    required this.icon,
  });
}