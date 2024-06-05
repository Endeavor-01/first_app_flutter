

import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  BillAmount({
    super.key, required this.onChanged, required this.billAmount,
  });
  final String billAmount;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.attach_money),
          labelText: 'Bill Amount'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
