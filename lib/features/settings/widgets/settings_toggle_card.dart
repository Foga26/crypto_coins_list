import 'package:flutter/material.dart';

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 43, 126, 151).withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5),
                    child: Text(
                      title,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  Switch.adaptive(value: value, onChanged: onChanged)
                ],
              ))),
    );
  }
}
