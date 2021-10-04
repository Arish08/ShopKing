import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopking/models/catalog.dart';
import 'package:shopking/pages/home_detail_page.dart';
import 'package:shopking/widgets/drawer.dart';
import 'package:shopking/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'cart_page.dart';
import 'home_detail_page.dart';
import 'package:shopking/utils/routes.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                // ignore: unnecessary_null_comparison
                if (CatalogModel.products != null &&
                    CatalogModel.products.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator(
                    backgroundColor: MyTheme.cdarkbluishcolor,
                  ).centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shopking".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending products".text.color(context.accentColor).xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.products.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.products[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      // ignore: unnecessary_null_comparison
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image)
                .w20(context)
                .box
                .roundedLg
                .p8
                .color(context.theme.shadowColor)
                .make()
                .p16(),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              5.heightBox,
              catalog.desc.text
                  .textStyle(
                    context.captionStyle!,
                  )
                  .color(context.accentColor)
                  .bold
                  .make(),
              20.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.all(0),
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .color(context.accentColor)
                      .xl2
                      .make()
                      .pOnly(top: 13),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(
                        context.theme.buttonColor,
                      ),
                    ),
                  ).pOnly(top: 10).pOnly(right: 20)
                ],
              )
            ],
          ))
        ],
      ),
    ).color(context.theme.shadowColor).rounded.square(120).make().py16();
  }
}
