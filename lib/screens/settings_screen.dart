import 'package:flutter/material.dart';
import 'package:food/components/main_drawer.dart';
import 'package:food/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          activeColor: Theme.of(context).colorScheme.secondary,
          title: Text(title),
          subtitle: Text(subtitle),
          value: value,
          onChanged: (value) {
            onChanged(value);
            widget.onSettingsChanged(settings);
          },
        ),
        const Divider(
          height: 15,
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe refeições sem glúten!',
                  value: settings.isGlutenFree,
                  onChanged: (value) => setState(
                    () => settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose!',
                  value: settings.isLactoseFree,
                  onChanged: (value) => setState(
                    () => settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições veganas!',
                  value: settings.isVegan,
                  onChanged: (value) => setState(
                    () => settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas!',
                  value: settings.isVegetarian,
                  onChanged: (value) => setState(
                    () => settings.isVegetarian = value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
