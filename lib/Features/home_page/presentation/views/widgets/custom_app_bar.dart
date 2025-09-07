import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/assets.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_cupertino_text_field.dart';

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
