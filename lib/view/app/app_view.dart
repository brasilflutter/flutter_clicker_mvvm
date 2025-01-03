import 'package:flutter/material.dart';
import 'package:teste_clicker/data/repositories/value_modifier_repository.dart';
import 'package:teste_clicker/data/services/points_service.dart';
import 'package:teste_clicker/data/services/shop_service.dart';
import 'package:teste_clicker/data/services/value_modifier_service.dart';
import 'package:teste_clicker/view/clicker/clicker_view_model.dart';
import 'package:teste_clicker/view/splash/splash_view.dart';

import '../../data/repositories/points_repository.dart';
import '../../data/repositories/shop_repository.dart';
import '../clicker/clicker_view.dart';
import '../shop/shop_view.dart';
import '../shop/shop_view_model.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final valueService = ValueModifierService();
  final shopService = ShopService();
  final pointsService = PointsService();

  late final pointsRepository = PointsRepository(
    pointsService,
    valueService,
  );

  late final shopRepository = ShopRepository(
    shopService,
    pointsService,
    valueService,
  );

  late final valueRepository = ValueModifierRepository(
    valueService,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/shop': (context) => ShopView(
              viewModel: ShopViewModel(
                shopRepository,
                pointsRepository,
              ),
            ),
        '/splash': (context) => SplashView(),
        '/game': (context) => ClickerView(
              viewModel: ClickerViewModel(
                pointsRepository,
              ),
            ),
      },
      initialRoute: '/splash',
    );
  }
}
