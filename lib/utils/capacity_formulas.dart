class CapacityFormulasResult {
  const CapacityFormulasResult({
    required this.barrelsPerLinFt,
    required this.linFtPerBarrel,
    required this.cuFtPerLinFt,
    required this.linFtPerCuFt,
    required this.gallonsPerLinFt,
    required this.linFtPerGallon,
  });

  final double barrelsPerLinFt;
  final double linFtPerBarrel;
  final double cuFtPerLinFt;
  final double linFtPerCuFt;
  final double gallonsPerLinFt;
  final double linFtPerGallon;
}

class CapacityFormulasCalculator {
  const CapacityFormulasCalculator._();

  static CapacityFormulasResult calculate(double diameterInches) {
    final diameterSquared = diameterInches * diameterInches;
    return CapacityFormulasResult(
      barrelsPerLinFt: 0.0009714 * diameterSquared,
      linFtPerBarrel: 1029.4 / diameterSquared,
      cuFtPerLinFt: 0.005454 * diameterSquared,
      linFtPerCuFt: 183.35 / diameterSquared,
      gallonsPerLinFt: 0.0408 * diameterSquared,
      linFtPerGallon: 24.51 / diameterSquared,
    );
  }
}
