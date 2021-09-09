import 'package:flutter/material.dart';
import 'package:qrreader/src/pages/results_list_page.dart';

class UrisPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return ResultsList(tipo: 'http');
  }
}