import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isProductExistInCart(int selectedSize) {
    final cartItem = Provider.of<CartProvider>(context, listen: false).cart;
    for (int i = 0; i < cartItem.length; i++) {
      if (widget.product['title'].toString() ==
              cartItem[i]['title'].toString() &&
          selectedSize.toInt() == cartItem[i]['sizes'] as int) {
        return true;
      }
    }
    return false;
  }

  void onTapAddToCart() {
    if (selectedSize != -1) {
      if (isProductExistInCart(selectedSize)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Product already exists in Cart"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        Provider.of<CartProvider>(context, listen: false).addProduct({
          "title": widget.product['title'],
          "price": widget.product['price'],
          "company": widget.product['company'],
          "sizes": selectedSize,
          "imageUrl": widget.product['imageUrl'],
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product Added to cart"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select a size")));
    }
  }

  static int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Column(
        children: [
          Text(
            widget.product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(widget.product['imageUrl'] as String),
          ),
          Spacer(flex: 2),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              selectedSize = -1;
                            });
                          },
                          onTap: () => {
                            setState(() {
                              selectedSize =
                                  (widget.product['sizes'] as List<int>)[index];
                            }),
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : Color.fromRGBO(245, 247, 249, 1),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onTapAddToCart();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
