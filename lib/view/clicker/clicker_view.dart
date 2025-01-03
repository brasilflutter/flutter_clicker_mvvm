import 'package:flutter/material.dart';
import 'package:teste_clicker/view/clicker/clicker_view_model.dart';

class ClickerView extends StatefulWidget {
  const ClickerView({
    super.key,
    required this.viewModel,
  });

  final ClickerViewModel viewModel;

  @override
  State<ClickerView> createState() => _ClickerViewState();
}

class _ClickerViewState extends State<ClickerView> {
  ClickerViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.init();
    });
  }

  void toStore() async {
    await Navigator.of(context).pushNamed('/shop');
    viewModel.loadPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          children: [
            const Text('Clicker'),
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
        leading: IconButton(
          onPressed: toStore,
          icon: const Icon(
            Icons.store,
          ),
        ),
      ),
      body: Center(
        child: SizedBox.square(
          dimension: 320,
          child: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: viewModel.increment,
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}
