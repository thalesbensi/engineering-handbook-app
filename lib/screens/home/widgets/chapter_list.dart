import 'package:flutter/material.dart';

import '../../../models/chapter.dart';

class ChapterList extends StatelessWidget {
  const ChapterList({
    super.key,
    required this.chapters,
    required this.onTap,
  });

  final List<Chapter> chapters;
  final ValueChanged<Chapter> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: chapters
          .map((chapter) => _ChapterCard(
                chapter: chapter,
                onTap: () => onTap(chapter),
              ))
          .toList(),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  const _ChapterCard({required this.chapter, required this.onTap});

  final Chapter chapter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF13202D),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFC0A16B),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  chapter.code,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: const Color(0xFF13202D),
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFFF6F2EA),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chapter.subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFFB5C0CC),
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: Color(0xFFC0A16B)),
          ],
        ),
      ),
    );
  }
}
