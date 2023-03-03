import 'package:flutter/material.dart';
import 'package:mentlo/core/utils/shared_widgets/settings_item.dart';
import 'package:mentlo/core/utils/styles/icon_broken.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsItem(
              text: 'Profile',
              icon: Icons.person,
              onTap: () {
                debugPrint('pressed');
              },
            ),

          ],
        ),
      ),
    );
  }
}
