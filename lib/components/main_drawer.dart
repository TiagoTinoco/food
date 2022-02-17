import 'package:flutter/material.dart';
import 'package:food/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 26),
      onTap: onTap,
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _createItem(
              icon: Icons.restaurant,
              label: 'Refeições',
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createItem(
              icon: Icons.settings,
              label: 'Configurações',
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}
