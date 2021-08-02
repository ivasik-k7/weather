enum TemperatureUnit {
  Metric,
  Imperial,
  Standart,
}

extension TemperatureUnitTextExtension on TemperatureUnit {
  String? get code => {
        TemperatureUnit.Imperial: 'imperial',
        TemperatureUnit.Metric: 'metric',
        TemperatureUnit.Standart: 'standart',
      }[this];

  String? get title => {
        TemperatureUnit.Imperial: 'Fahrenheit',
        TemperatureUnit.Metric: 'Celcius',
        TemperatureUnit.Standart: 'Kalvin',
      }[this];
}
