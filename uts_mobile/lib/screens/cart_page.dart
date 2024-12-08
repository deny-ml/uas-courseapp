import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Color.fromARGB(255, 112, 50, 163),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Ganti dengan jumlah item di keranjang
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.book, color: Colors.deepPurple),
                    title: Text('Course Title ${index + 1}'),
                    subtitle: Text('Price: \$${(index + 1) * 20}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // TODO: Handle remove item from cart
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle checkout process
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 112, 50, 163),
              ),
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
