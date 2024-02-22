import 'package:crypto_coins_list/features/crypto_list/widgets/base_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SearchCoinBottomSheet extends StatefulWidget {
  const SearchCoinBottomSheet({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  State<SearchCoinBottomSheet> createState() => _SearchCoinBottomSheetState();
}

class _SearchCoinBottomSheetState extends State<SearchCoinBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: theme.hintColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    controller: widget.searchController,
                    decoration: InputDecoration(
                        hintText: 'Поиск',
                        hintStyle:
                            TextStyle(color: theme.hintColor.withOpacity(0.4)),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                )),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _onTapSearch(context),
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
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const ListTile(
                        title: Text('sadasd'),
                      ),
                  separatorBuilder: (context, _) => const Divider(
                        color: Colors.transparent,
                        height: 1,
                      ),
                  itemCount: 15))
        ],
      ),
    );
  }

  void _onTapSearch(BuildContext context) =>
      Navigator.of(context).pop(widget.searchController.text);
}
