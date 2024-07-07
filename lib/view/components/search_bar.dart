import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  

   final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            Icons.qr_code_scanner,
            color: Colors.grey,
          ),
          hintText: 'Try "Android Dev" ',
          hintStyle: TextStyle(
              color: const Color.fromARGB(255, 183, 181, 181)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}