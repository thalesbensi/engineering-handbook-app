import 'package:flutter/material.dart';

import '../../data/chapters.dart';
import '../../models/chapter.dart';
import '../chapters/chapter_detail_page.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/category_chips.dart';
import 'widgets/chapter_list.dart';
import 'widgets/featured_formula_card.dart';
import 'widgets/quick_actions.dart';
import 'widgets/recent_list.dart';
import 'widgets/search_field.dart';
import 'widgets/top_bar.dart';

class HandbookHomePage extends StatelessWidget {
  const HandbookHomePage({super.key});

  void _openChapter(BuildContext context, Chapter chapter) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChapterDetailPage(chapter: chapter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6F2EA), Color(0xFFE9E2D6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(onProfileTap: () {}),
                const SizedBox(height: 16),
                Text(
                  'Engineering\nHandbook',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Referências e fórmulas para cálculos em operações petrolíferas.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF4B5866),
                        height: 1.4,
                      ),
                ),
                const SizedBox(height: 20),
                SearchField(onChanged: (_) {}),
                const SizedBox(height: 20),
                Text(
                  'Capítulos',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                ChapterList(
                  chapters: chapters,
                  onTap: (chapter) => _openChapter(context, chapter),
                ),
                const SizedBox(height: 24),
                Text(
                  'Categorias',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                const CategoryChips(),
                const SizedBox(height: 24),
                Text(
                  'Formula em destaque',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                FeaturedFormulaCard(
                  onTap: () {},
                  colors: colors,
                ),
                const SizedBox(height: 24),
                Text(
                  'Ferramentas rapidas',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                const QuickActions(),
                const SizedBox(height: 24),
                Text(
                  'Recentes',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12),
                const RecentList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
