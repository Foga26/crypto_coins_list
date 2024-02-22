import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.hintColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 10),
            Text('Поиск', style: TextStyle(color: theme.hintColor))
          ],
        ),
      ),
    );
  }
}
