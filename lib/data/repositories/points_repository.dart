import 'package:teste_clicker/data/services/points_service.dart';
import 'package:teste_clicker/data/services/value_modifier_service.dart';

class PointsRepository {
  final PointsService pointsService;
  final ValueModifierService valueModifierService;

  const PointsRepository(
    this.pointsService,
    this.valueModifierService,
  );

  Future<double> increment() async {
    final valueModifiers = await valueModifierService.getModifiers();

    final modifierValue = valueModifiers.fold(
      1.0,
      (a, b) => a + b.modifier,
    );

    return await pointsService.addPoints(modifierValue);
  }

  Future<double> getPoints() async {
    return await pointsService.getPoints();
  }

  Future<void> setPoints(double points) async {
    await pointsService.setPoints(points);
  }
}
