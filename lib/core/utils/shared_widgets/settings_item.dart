import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const SettingsItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Row(
          children: [
            Expanded(
              child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Icon(
              icon,
              size: 36,
            ),
          ],
        ),
      ),
    );
  }
}
