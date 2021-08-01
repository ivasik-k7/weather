DateTime? dateFromJson(int value) =>
    DateTime?.fromMillisecondsSinceEpoch(value);

int? dateToJson(DateTime? date) => date?.millisecondsSinceEpoch;

dynamic stringify(dynamic value) => value != null ? '$value' : null;

dynamic toInt(dynamic value) {
  if (value == null) return null;
  final result = int.tryParse(value);

  return result != null ? result : value;
}

dynamic toNull(dynamic value) => null;
