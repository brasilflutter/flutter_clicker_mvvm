import 'package:shared_preferences/shared_preferences.dart';

class PointsService {
  Future<double> addPoints(double increment) async {
    final prefs = SharedPreferencesAsync();
    final points = await getPoints();
    final newPoints = points + increment;
    prefs.setDouble('points', newPoints);

    return newPoints;
  }

  Future<double> getPoints() async {
    final prefs = SharedPreferencesAsync();
    final points = await prefs.getDouble('points') ?? 0;

    return points;
  }

  Future<void> setPoints(double points) async {
    final prefs = SharedPreferencesAsync();
    await prefs.setDouble('points', points);
  }
}
