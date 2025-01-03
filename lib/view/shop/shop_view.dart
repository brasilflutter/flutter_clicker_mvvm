import 'package:flutter/material.dart';
import 'package:teste_clicker/view/shop/shop_view_model.dart';

class ShopView extends StatefulWidget {
  const ShopView({
    super.key,
    required this.viewModel,
  });

  final ShopViewModel viewModel;

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  ShopViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          children: [
            const Text('Shop'),
            ValueListenableBuilder(
              valueListenable: viewModel.pointsNotifier,
              builder: (context, value, child) {
                return Badge(
                  label: Text(
                    (value?.toInt() ?? '').toString(),
                  ),
                  child: Icon(
                    Icons.flutter_dash,
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: const Center(
        child: Text('Shop'),
      ),
    );
  }
}
