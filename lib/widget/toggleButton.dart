


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculater_app/providers/ThemeProvider.dart';

class toggleThemeButton extends StatelessWidget {
  const toggleThemeButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final toggle = Provider.of<ThemeProvider>(context);
    return IconButton(onPressed: () => toggle.toggleButton(), icon: toggle.isdark?
    Icon(Icons.wb_sunny)
        : Icon(Icons.nightlight));
  }
}