import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodApp - $username"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/food_banner.jpeg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Daftar menu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                final food = foodMenu[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(food.image, height: 80),
                      Text(
                        food.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Rp${food.price}"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(food: food),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Pesan"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Food {
  final String name;
  final int price;
  final String image;

  Food({required this.name, required this.price, required this.image});
}

final List<Food> foodMenu = [
  Food(name: "Burger", price: 25000, image: "assets/burger.jpeg"),
  Food(name: "Pizza", price: 50000, image: "assets/pizza.jpeg"),
  Food(name: "Sushi", price: 40000, image: "assets/sushi.jpeg"),
  Food(name: "Steak", price: 60000, image: "assets/steak.jpeg"),
];
