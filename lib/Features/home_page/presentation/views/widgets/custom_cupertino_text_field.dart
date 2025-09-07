
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoTextField extends StatelessWidget {
  final bool isTapped;
  const CustomCupertinoTextField({super.key, required this.searchController, required this.isTapped});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onTap: () {},
      onSubmitted: (value) {},
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(Icons.cancel, color: Colors.black54, size: 16),
      ),
      cursorColor: Colors.black54,
      controller: searchController,
      placeholder: "Search...",
      placeholderStyle: TextStyle(color: Colors.black54),
      style: TextStyle(color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
