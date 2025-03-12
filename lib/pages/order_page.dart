import 'package:flutter/material.dart';
import 'home_page.dart';

class OrderPage extends StatefulWidget {
  final Food food;

  const OrderPage({super.key, required this.food});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;
  bool showTotalPrice = false; // Menyembunyikan total harga sebelum tombol diklik

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void _orderNow() {
    setState(() {
      showTotalPrice = true; // Tampilkan total harga saat tombol diklik
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pesanan berhasil dibuat! Total Harga: Rp${widget.food.price * quantity}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Makanan"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan semua elemen
          children: [
            Image.asset(widget.food.image, height: 150),
            const SizedBox(height: 20),
            Text(
              widget.food.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Tengah
            ),
            Text("Harga: Rp${widget.food.price}", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Tengah
              children: [
                IconButton(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove, color: Colors.red),
                ),
                Text("$quantity", style: const TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: _increment,
                  icon: const Icon(Icons.add, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (showTotalPrice) // Hanya tampil setelah tombol ditekan
              Text(
                "Total Harga: Rp${widget.food.price * quantity}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _orderNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text("Pesan Sekarang"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
