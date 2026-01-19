import 'package:flutter/material.dart';

class FeaturedFormulaCard extends StatelessWidget {
  const FeaturedFormulaCard({
    super.key,
    required this.onTap,
    required this.colors,
  });

  final VoidCallback onTap;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF13202D),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gradiente de pressao',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colors.surface,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Delta P = 0,433 x r x h',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFFC0A16B),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'Use para estimar a pressao diferencial em colunas de fluido com densidade variavel.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.surface.withOpacity(0.85),
                    height: 1.4,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: colors.surface.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'API 14C',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: colors.surface,
                        ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Atualizado ha 2 dias',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: colors.surface.withOpacity(0.7),
                      ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward, color: Color(0xFFC0A16B)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
