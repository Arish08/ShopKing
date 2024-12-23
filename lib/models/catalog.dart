class CatalogModel {
  static final catModel = CatalogModel.internal();

  Null orElse;
  CatalogModel.internal();

  factory CatalogModel() => catModel;

  static List<Item> products = [];

  var items;

  //Get item by ID
  Item getbyId(int id) =>
      items.firstWhere((element) => element.id = id, orElse = null);

  Item getbyposition(int pos) => products[pos];

  //getbyId(int id) {}
}

class Item {
  late final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
