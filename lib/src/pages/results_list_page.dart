import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/src/providers/scan_list_provider.dart';
import 'package:qrreader/src/utils/utils.dart';

class ResultsList extends StatelessWidget {
  final String tipo;
  const ResultsList({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(
      context, /*listen: false*/
    );

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => Dismissible(
            key: UniqueKey(),
            onDismissed: (DismissDirection direction) {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarScanPorId(scanListProvider.scans[i].id!);
            },
            background: Container(color: Colors.red),
            child: ListTile(
              leading: Icon(
                  this.tipo == 'http' ? Icons.http : Icons.location_on,
                  color: Theme.of(context).primaryColor),
              title: Text(scanListProvider.scans[i].valor),
              subtitle: Text('ID: ${scanListProvider.scans[i].id.toString()}'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => launchURL(context, scanListProvider.scans[i]),
            )));
  }
}
