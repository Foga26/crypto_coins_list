import 'package:flutter/material.dart';

class DataRowWidget extends StatelessWidget {
  const DataRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
