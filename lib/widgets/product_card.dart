import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCardWdget extends StatelessWidget {
  final Map<String, dynamic> product;
  final backgroundColor;
  const ProductCardWdget({
    super.key,
    required this.product,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product['title'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 5),
          Text(
            "\$ ${product['price']}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 5),
          Center(child: Image.network(product['imageUrl'] as String)),
        ],
      ),
    );
  }
}
