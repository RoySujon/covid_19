import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
        Divider(),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
