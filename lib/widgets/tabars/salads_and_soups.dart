import 'package:flutter/material.dart';

import '../item_detailes.dart';

class SaladsAndSoups extends StatelessWidget {
  const SaladsAndSoups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ItemDetailes(index: index),
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: 10,
    );
  }
}
