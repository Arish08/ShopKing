import 'package:flutter/material.dart';
import 'package:shopking/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      //backgroundColor: Colors.grey[100],
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.xl3.red900.make(),
          ElevatedButton(
            onPressed: () {},
            child: "Buy".text.make(),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.all(
                context.theme.focusColor,
              ),
            ),
          ).wh(100, 50)
        ],
      ).p(24),
      body: SafeArea(
        //bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
                fit: BoxFit.cover,
              ).h40(context),
            ),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                    width: context.screenWidth,
                    color: context.theme.shadowColor,
                    child: Column(children: [
                      catalog.name.text.xl4
                          .color(context.theme.focusColor)
                          .bold
                          .make(),
                      15.heightBox,
                      catalog.desc.text.xl2
                          .textStyle(
                            context.captionStyle!,
                          )
                          .color(context.accentColor)
                          .bold
                          .make(),
                      30.heightBox,
                      "Amet sanctus et rebum justo kasd. Sit aliquyam gubergren labore duo et dolores erat, no diam sed voluptua eirmod kasd lorem justo est Amet sanctus et rebum justo kasd. Sit aliquyam gubergren "
                          .text
                          .textStyle(context.captionStyle!)
                          .color(context.accentColor)
                          .bold
                          .center
                          .make()
                          .px32(),
                    ]).py64()),
              ),
            ),
          ],
        ).py0(),
      ),
    );
  }
}
