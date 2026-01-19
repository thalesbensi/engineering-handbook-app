import 'package:flutter/material.dart';

import '../../models/chapter.dart';

class ChapterDetailPage extends StatelessWidget {
  const ChapterDetailPage({super.key, required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
        backgroundColor: colors.surface,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6F2EA), Color(0xFFE9E2D6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Text(
              chapter.subtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF4B5866),
                    height: 1.4,
                  ),
            ),
            const SizedBox(height: 20),
            ...chapter.topics.map(
              (topic) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0E7D8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.menu_book_outlined,
                        color: Color(0xFF13202D),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        topic,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: const Color(0xFF13202D),
                            ),
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Color(0xFF65707E)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
