class WeatherClientConfig {
  String _location = 'Kyiv';
  String _unit = 'metric';
  String _lang = 'uk';

  String get location => _location;
  String get unit => _unit;
  String get language => _lang;

  set location(String loc) {
    if (loc.isNotEmpty && loc != _location) _location = loc;
  }

  set unit(String un) {
    if (un.isNotEmpty && un != _unit) _unit = un;
  }

  set language(String locale) {
    if (locale.isNotEmpty && locale != _lang) _lang = locale;
  }
}
