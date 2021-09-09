import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/pages/mapas_page.dart';
import 'package:qrreader/src/pages/uris_page.dart';
import 'package:qrreader/src/providers/scan_list_provider.dart';
import 'package:qrreader/src/providers/ui_provider.dart';
import 'package:qrreader/src/widgets/navbar.dart';
import 'package:qrreader/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Titulo'), actions: [
        IconButton(
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarScans();
            },
            icon: Icon(Icons.delete_forever))
      ]),
      body: Center(
        child: _HomePageBody(),
      ),
      bottomNavigationBar: NavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return UrisPage();

      default:
        return MapasPage();
    }
  }
}
