import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/capacity_formulas.dart';

class CapacityFormulasPage extends StatefulWidget {
  const CapacityFormulasPage({super.key});

  @override
  State<CapacityFormulasPage> createState() => _CapacityFormulasPageState();
}

class _CapacityFormulasPageState extends State<CapacityFormulasPage> {
  final TextEditingController _controller = TextEditingController();
  double? _diameter;
  bool _isValid = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDiameterChanged(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      setState(() {
        _diameter = null;
        _isValid = true;
      });
      return;
    }

    final parsed = double.tryParse(trimmed);
    if (parsed == null || parsed < 0) {
      setState(() {
        _diameter = null;
        _isValid = false;
      });
      return;
    }

    setState(() {
      _diameter = parsed;
      _isValid = parsed > 0;
    });
  }

  String _formatNumber(double value) {
    final fixed = value.toStringAsFixed(4);
    return fixed.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  String _formatValue(double? value) {
    if (_diameter == null) {
      return '—';
    }
    if (_diameter != null && _diameter! <= 0) {
      return '0';
    }
    return _formatNumber(value ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final hasValidDiameter = _diameter != null && _diameter! > 0;
    final result =
        hasValidDiameter ? CapacityFormulasCalculator.calculate(_diameter!) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Capacity Formulas'),
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
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            children: [
              Text(
                'CAPACITY FORMULAS',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 28,
                      letterSpacing: 1.1,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the diameter and view the calculated capacity values.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF4B5866),
                      height: 1.4,
                    ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,4}$')),
                ],
                decoration: InputDecoration(
                  labelText: 'Diameter (D) in inches',
                  hintText: 'e.g. 5.5',
                  errorText: _isValid ? null : 'Enter a positive number',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.95),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _onDiameterChanged,
              ),
              const SizedBox(height: 20),
              _FormulaCard(
                title: 'Barrels per Linear Foot',
                formula: const _InlineFormula(
                  coefficient: '0.0009714',
                ),
                value: _formatValue(result?.barrelsPerLinFt),
              ),
              _FormulaCard(
                title: 'Linear Feet per Barrel',
                formula: const _FractionFormula(numerator: '1029.4'),
                value: _formatValue(result?.linFtPerBarrel),
              ),
              _FormulaCard(
                title: 'Cubic Feet per Linear Foot',
                formula: const _InlineFormula(
                  coefficient: '0.005454',
                ),
                value: _formatValue(result?.cuFtPerLinFt),
              ),
              _FormulaCard(
                title: 'Linear Feet per Cubic Foot',
                formula: const _FractionFormula(numerator: '183.35'),
                value: _formatValue(result?.linFtPerCuFt),
              ),
              _FormulaCard(
                title: 'Gallons per Linear Foot',
                formula: const _InlineFormula(
                  coefficient: '0.0408',
                ),
                value: _formatValue(result?.gallonsPerLinFt),
              ),
              _FormulaCard(
                title: 'Linear Feet per Gallon',
                formula: const _FractionFormula(numerator: '24.51'),
                value: _formatValue(result?.linFtPerGallon),
              ),
              const SizedBox(height: 16),
              Text(
                'D = diameter in inches',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF4B5866),
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                'No allowance made for internal restrictions and tool joints.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF4B5866),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormulaCard extends StatelessWidget {
  const _FormulaCard({
    required this.title,
    required this.formula,
    required this.value,
  });

  final String title;
  final Widget formula;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF13202D),
                      ),
                ),
                const SizedBox(height: 6),
                formula,
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF13202D),
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _InlineFormula extends StatelessWidget {
  const _InlineFormula({required this.coefficient});

  final String coefficient;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF4B5866),
        );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$coefficient ', style: style),
        const _DiameterSquaredText(),
      ],
    );
  }
}

class _FractionFormula extends StatelessWidget {
  const _FractionFormula({required this.numerator});

  final String numerator;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF4B5866),
        );
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(numerator, style: style),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 1,
            width: double.infinity,
            color: const Color(0xFF4B5866),
          ),
          const _DiameterSquaredText(),
        ],
      ),
    );
  }
}

class _DiameterSquaredText extends StatelessWidget {
  const _DiameterSquaredText();

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color(0xFF4B5866),
        );
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'D', style: baseStyle),
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Transform.translate(
              offset: const Offset(0, -4),
              child: Text(
                '2',
                textScaleFactor: 0.8,
                style: baseStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
