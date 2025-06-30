import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_details_page.dart';
import 'package:shopping_app/widgets/nav_bar_widget.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/utils/global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Asics', 'Puma', 'New Balance'];

  late String selectedFilter;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          NavBarWidget(),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        selectedFilter = filter;
                      }),
                    },
                    child: Chip(
                      backgroundColor: (selectedFilter == filter
                          ? Color.fromRGBO(254, 206, 1, 1)
                          : Color.fromRGBO(245, 247, 249, 1)),
                      label: Text(filter, style: TextStyle(fontSize: 16)),
                      side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    ),
                  },
                  child: ProductCardWdget(
                    product: product,
                    backgroundColor: index.isEven
                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
