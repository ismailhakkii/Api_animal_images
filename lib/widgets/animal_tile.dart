import 'package:flutter/material.dart';

class AnimalTile extends StatelessWidget {
  final String title;
  final String query;
  final Function(String) onTap;

  const AnimalTile({
    Key? key,
    required this.title,
    required this.query,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => onTap(query),
    );
  }
}
