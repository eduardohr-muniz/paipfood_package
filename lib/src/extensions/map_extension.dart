extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> merge(Map<String, dynamic> other) {
    final Map<String, dynamic> merged = Map.from(this);

    other.forEach((key, value) {
      if (merged.containsKey(key) && merged[key] is Map<String, dynamic> && value is Map<String, dynamic>) {
        merged[key] = (merged[key] as Map<String, dynamic>).merge(value);
      } else {
        merged[key] = value;
      }
    });

    return merged;
  }
}
