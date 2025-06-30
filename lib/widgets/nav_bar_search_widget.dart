import 'package:flutter/material.dart';

class NavBarSearchWidget extends StatelessWidget {
  const NavBarSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
      ),
    );
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: "search",
          prefixIcon: Icon(Icons.search),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }
}
