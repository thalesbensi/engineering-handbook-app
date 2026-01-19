import 'package:flutter/material.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _RecentItem(
        title: 'Balanceamento de fluidos',
        subtitle: 'Calculo de densidade de lama',
        time: 'Ha 1 hora',
      ),
      _RecentItem(
        title: 'Perda de carga',
        subtitle: 'Tubulacao em serie',
        time: 'Ontem',
      ),
      _RecentItem(
        title: 'Taxa de producao',
        subtitle: 'Modelo de Darcy',
        time: '3 dias',
      ),
    ];
    return Column(
      children: items
          .map((item) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0E7D8),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.menu_book_outlined,
                        color: Color(0xFF13202D),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: const Color(0xFF13202D)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: const Color(0xFF65707E),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      item.time,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFF65707E),
                          ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _RecentItem {
  const _RecentItem({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final String title;
  final String subtitle;
  final String time;
}
