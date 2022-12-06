import 'package:shopking/models/catalog.dart';
import "package:shopking/pages/cart_page.dart ";

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;

  //catalog field

  //collection of Ids
  late CatalogModel _catalog;

  final List<int> _itemsIds = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  get products => CatalogModel.products;

  // ignore: unnecessary_getters_setters
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //List<Item> get items => _itemsIds.map((id) => _catalog.getbyId(id)).toList();

  //total price

  num get totalPrice =>
      CatalogModel.products.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  //remove item

  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
