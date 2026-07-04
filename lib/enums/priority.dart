enum Priority {
  low(1, "Low"),
  medium(2, "Medium"),
  high(3, "High");

  final int level;
  final String label;

  const Priority(this.level, this.label);

  static Priority fromString(String value) {
    return Priority.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Priority.low,
    );
  }
}