import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/assets.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController searchController = TextEditingController();
  bool isTapped = false;
  @override
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Image.asset(Assets.imagesYoutubeLogo, height: 34, width: 34),
        Text("Youtube"),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: isTapped
                ? CustomCupertinoTextField(searchController: searchController, isTapped: isTapped)
                : Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.search, color: Colors.white),
                  ),
          ),
        ),
      ],
    );
  }
}

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
