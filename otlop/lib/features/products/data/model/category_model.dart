class CategoryModel {
  final String image, title;

  CategoryModel({required this.image, required this.title});
  static List<CategoryModel> categories = [
    CategoryModel(image: "assets/images/juice.svg", title: "Frappuccino"),
    CategoryModel(image: "assets/images/coffee.svg", title: "Latte"),
    CategoryModel(image: "assets/images/mocha.svg", title: "Mocha"),
    CategoryModel(image: "assets/images/coffee.svg", title: "Macchiato"),
    CategoryModel(image: "assets/images/juice.svg", title: "Frappuccino"),
  ];
}
