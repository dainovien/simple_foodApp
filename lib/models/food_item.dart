class Food {
  final String name;
  final int price;
  final String image;

  Food({required this.name, required this.price, required this.image});
}

final List<Food> foodMenu = [
  Food(name: "Burger", price: 25000, image: "assets/pizza.jpeg"),
  Food(name: "Pizza", price: 50000, image: "assets/pizza.jpeg"),
  Food(name: "Sushi", price: 40000, image: "assets/pizza.jpeg"),
  Food(name: "Steak", price: 60000, image: "assets/pizza.jpeg"),
];