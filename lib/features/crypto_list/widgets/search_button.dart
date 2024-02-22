import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton(
      {super.key, required this.onTap, required this.controller});
  final VoidCallback onTap;
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
                color: theme.hintColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            child: TextField(
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
          const SizedBox(width: 8),
          GestureDetector(
            // onTap: () => _onTapSearch(context),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
