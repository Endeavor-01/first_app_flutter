

import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {

  TipSlider({
    super.key,
    required double tippercentage, required this.onChanged, required this.percentage,
  }) : _tippercentage = tippercentage;

  final double _tippercentage;
  final ValueChanged<double> onChanged;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Slider(value:_tippercentage,
      onChanged: onChanged,
      //   onChanged: (value)=>{
      //   setState(() {
      // _tippercentage = value;
      //   })
      // },
      min: 0,
      max: 0.5,
      divisions: 5,
      label: '${(_tippercentage*100).round()}%',
    );
  }
}