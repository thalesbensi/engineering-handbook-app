import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickActionItem(
        icon: Icons.calculate_outlined,
        label: 'Conversores',
      ),
      _QuickActionItem(
        icon: Icons.tune_outlined,
        label: 'Checklist',
      ),
      _QuickActionItem(
        icon: Icons.graphic_eq_outlined,
        label: 'Curvas',
      ),
      _QuickActionItem(
        icon: Icons.storage_outlined,
        label: 'Banco',
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions
          .map((action) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Icon(action.icon, color: const Color(0xFF13202D)),
                        const SizedBox(height: 6),
                        Text(
                          action.label,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: const Color(0xFF13202D),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _QuickActionItem {
  const _QuickActionItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
