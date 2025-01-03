import 'package:flutter/cupertino.dart';
import 'package:teste_clicker/data/repositories/points_repository.dart';

class ClickerViewModel {
  final PointsRepository pointsRepository;

  final pointsNotifier = ValueNotifier<double?>(null);

  ClickerViewModel(
    this.pointsRepository,
  );

  Future<void> increment() async {
    pointsNotifier.value = await pointsRepository.increment();
  }

  Future<void> loadPoints() async {
    pointsNotifier.value = await pointsRepository.getPoints();
  }

  void init(){
    loadPoints();
  }
}
