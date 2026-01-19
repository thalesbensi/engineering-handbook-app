import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Producao',
      'Perfuracao',
      'Escoamento',
      'Reservatorio',
      'Seguranca',
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: categories.map((label) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF13202D),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFFF6F2EA),
                ),
          ),
        );
      }).toList(),
    );
  }
}
