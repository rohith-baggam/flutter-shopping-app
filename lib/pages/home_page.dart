import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/product_details_page.dart';

import 'package:shopping_app/widgets/nav_bar_widget.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Asics', 'Puma', 'New Balance'];
  int currentPage = 0;

  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) => {
          setState(() {
            currentPage = value;
          }),
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 35), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 35),
            label: "",
          ),
        ],
      ),
    );
  }
}
