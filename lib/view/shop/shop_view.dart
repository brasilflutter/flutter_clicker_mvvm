import 'package:flutter/material.dart';
import 'package:teste_clicker/view/shop/shop_list_tile.dart';
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
      body: ValueListenableBuilder(
        valueListenable: viewModel.shopItemsNotifier,
        builder: (context, value, child) {
          if (value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final item = value[index];

              return ShopItemTile(
                item: item,
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
