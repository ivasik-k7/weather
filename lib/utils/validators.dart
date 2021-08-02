abstract class Validators<T> {
  static Function compose(List<Function> validators) {
    return (value) {
      String? result;
      for (final fn in validators) {
        result = fn(value);

        if (result != null) return result;
      }

      return null;
    };
  }

  static String? required(Object? value) {
    if (value == null || '$value'.isEmpty) return "Value is required";
    return null;
  }
}
