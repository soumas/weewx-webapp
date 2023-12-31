class ValueAggDataEntity {
  final String at;
  final double value;
  final String units;

  ValueAggDataEntity({
    required this.at,
    required this.value,
    required this.units,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueAggDataEntity &&
        other.at == at &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => at.hashCode ^ value.hashCode ^ units.hashCode;
}
