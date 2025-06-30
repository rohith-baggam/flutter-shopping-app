import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/brand_title_widget.dart';
import 'package:shopping_app/widgets/nav_bar_search_widget.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [BrandTitleWidget(), NavBarSearchWidget()]);
  }
}
