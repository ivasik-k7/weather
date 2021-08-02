import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wapp/di/singletons/weather_config.dart';
import 'package:wapp/domain/enums/temperature.dart';
import 'package:wapp/utils/validators.dart';

// ignore: must_be_immutable
class PreferencesPage extends StatefulWidget {
  PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final config = GetIt.instance<WeatherClientConfig>();
  final formKey = GlobalKey<FormState>();

  late TextEditingController locationController;
  late String selectUnit;

  EdgeInsets padding = EdgeInsets.all(10);

  @override
  void initState() {
    locationController = TextEditingController(text: config.location);
    selectUnit = config.unit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('Save'),
          onPressed: handleStateSaving,
        ),
        body: Container(
          padding: padding,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Align(
                  child: Text(
                    'Preferences',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: Validators.required,
                        controller: locationController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: _buildInputDecoration(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: TemperatureUnit.values.length,
                      childAspectRatio: 3.2,
                    ),
                    children: TemperatureUnit.values
                        .map(
                          (e) => InkWell(
                            onTap: () => handleChangingUnit(e),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: selectUnit == e.code
                                    ? Colors.black54
                                    : Colors.black38,
                              ),
                              alignment: Alignment.center,
                              child: Text(e.title ?? ''),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleStateSaving() {
    final state = formKey.currentState;
    if (state!.validate()) {
      config.location = locationController.text;
      config.unit = TemperatureUnit.Imperial.code ?? "";
    }
  }

  void handleChangingUnit(TemperatureUnit e) {
    config.unit = selectUnit = e.code ?? '';
    setState(() {});
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: 'Location',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    );
  }
}
