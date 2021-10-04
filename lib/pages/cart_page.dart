import 'package:flutter/material.dart';
import 'package:shopking/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).bold.make(),
        centerTitle: true,
      ),
    );
  }
}
