import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/providers/scan_list_provider.dart';
import 'package:qrreader/src/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        final barcodeScanRes = 'geo:-34.5,-58.5';
        if (barcodeScanRes == '-1') return;
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);
      },
    );
  }
}
