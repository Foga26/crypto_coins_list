import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key, required this.onChanged, required this.controller});
  final void Function(String)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: TextStyle(color: theme.hintColor.withOpacity(0.4)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )),
        ],
      ),
    );
  }
}
