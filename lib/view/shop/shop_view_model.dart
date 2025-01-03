import 'package:flutter/cupertino.dart';
import 'package:teste_clicker/data/repositories/points_repository.dart';

import '../../data/models/shop_item_model.dart';
import '../../data/repositories/shop_repository.dart';

class ShopViewModel {
  ShopViewModel(
    this.shopRepository,
    this.pointsRepository,
  );

  final ShopRepository shopRepository;
  final PointsRepository pointsRepository;
  final shopItemsNotifier = ValueNotifier<List<ShopItemModel>?>(null);
  final pointsNotifier = ValueNotifier<double?>(null);

  Future<void> loadShopItems() async {
    final items = await shopRepository.getItems();
    shopItemsNotifier.value = items;
  }

  Future<void> buyItem(ShopItemModel item) async {
    await shopRepository.buyItem(item);
  }

  Future<void> loadPoints() async {
    final points = await pointsRepository.getPoints();
    pointsNotifier.value = points;
  }

  Future<void> init() async {
    loadShopItems();
    loadPoints();
  }
}
