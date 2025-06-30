import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // This is using Provider
    // final cartItems = Provider.of<CartProvider>(context).cart;
    // This is getting Provider from context
    // This helps as shortcut code and also make less changes when we are not replacing with different Provider
    final cartItems = context.watch<CartProvider>().cart;
    return cartItems.isEmpty
        ? Center(
            child: Text(
              "Your Cart is Empty",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        : Scaffold(
            appBar: AppBar(title: Text("Cart")),
            body: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      cartItem['imageUrl'].toString(),
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    cartItem['title'].toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text('Size: ${cartItem["sizes"].toString()}'),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Delete Product",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: Text(
                              "Are you sure you want remove item from cart",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<CartProvider>().removeProduct(
                                    cartItem,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),
          );
  }
}
