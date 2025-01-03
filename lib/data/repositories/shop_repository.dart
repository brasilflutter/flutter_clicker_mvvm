import 'package:teste_clicker/data/models/value_modifier_model.dart';
import 'package:teste_clicker/data/services/points_service.dart';
import 'package:teste_clicker/data/services/shop_service.dart';
import 'package:teste_clicker/data/services/value_modifier_service.dart';

import '../models/shop_item_model.dart';

class ShopRepository {
  final ShopService shopService;
  final PointsService pointsService;
  final ValueModifierService valueModifierService;

  const ShopRepository(
    this.shopService,
    this.pointsService,
    this.valueModifierService,
  );

  Future<void> buyItem(ShopItemModel item) async {
    final points = await pointsService.getPoints();

    if (points >= item.price) {
      await pointsService.setPoints(points - item.price);
      await valueModifierService.addModifier(
        ValueModifierModel(
          id: item.id,
          modifier: item.modifier,
        ),
      );
    }
  }

  Future<List<ShopItemModel>> getItems() async {
    return shopService.getItems();
  }
}
