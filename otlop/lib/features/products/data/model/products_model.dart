class ProductsModel {
  final String image, title, subtitle, price;
  ProductsModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });

  static List<ProductsModel> products = [
    ProductsModel(
      image: 'assets/images/Container.png',
      title: 'Starbucks',
      subtitle: 'Blueberry Cheesecake',
      price: '200 ',
    ),
    ProductsModel(
      image: 'assets/images/Container (1).png',
      title: 'Starbucks',
      subtitle: 'Double Caramel Frappuccino',
      price: '155 ',
    ),
    ProductsModel(
      image: 'assets/images/Container.png',
      title: 'Starbucks',
      subtitle: 'Blueberry Cheesecake',
      price: '200 ',
    ),
    ProductsModel(
      image: 'assets/images/Container (1).png',
      title: 'Starbucks',
      subtitle: 'Double Caramel Frappuccino',
      price: '155 ',
    ),
  ];
static  List<ProductsModel> filterProducts = [
    ProductsModel(
      image: 'assets/images/coffee.png',
      title: 'Costa',
      subtitle: 'Vanilla Latte',
      price: '120',
    ),ProductsModel(
      image: 'assets/images/mocha.png',
      title: 'Costa',
      subtitle: 'Chocolate Mocha',
      price: '120',
    ),ProductsModel(
      image: 'assets/images/coffee.png',
      title: 'Costa',
      subtitle: 'Vanilla Latte',
      price: '120',
    ),ProductsModel(
      image: 'assets/images/mocha.png',
      title: 'Costa',
      subtitle: 'Chocolate Mocha',
      price: '120',
    ),
  ];
  static  List<ProductsModel> filterProductsByCategory = [
    ProductsModel(
      image: 'assets/images/coffee.png',
      title: 'Costa',
      subtitle: 'Vanilla Latte',
      price: '120',
    ),ProductsModel(
      image: 'assets/images/mocha.png',
      title: 'Costa',
      subtitle: 'Chocolate Mocha',
      price: '120',
    )];
}
