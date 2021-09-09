import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/providers/ui_provider.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones')
        ]);
  }
}
