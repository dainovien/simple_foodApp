import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../pages/order_page.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(food.image, height: 80),
          Text(food.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text("Rp${food.price}"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderPage(food: food)),
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
  }
}
