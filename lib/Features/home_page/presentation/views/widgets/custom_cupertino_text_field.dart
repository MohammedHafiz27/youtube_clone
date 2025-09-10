import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/home_page/presentation/view_models/video_cubit/video_cubit.dart';

class CustomCupertinoTextField extends StatelessWidget {
  final bool isTapped;
  final VoidCallback onCancel;
  const CustomCupertinoTextField({
    super.key,
    required this.searchController,
    required this.isTapped,
    required this.onCancel,
  });

  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onTap: () {},
      onSubmitted: (value) {
        context.read<VideoCubit>().getSearchData(value);
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
        searchController.clear();
        onCancel();
      },
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: GestureDetector(
          onTap: () {
            searchController.clear();
            FocusManager.instance.primaryFocus?.unfocus();
            onCancel();
          },
          child: Icon(Icons.cancel, color: Colors.black54, size: 16),
        ),
      ),
      cursorColor: Colors.black54,
      controller: searchController,
      placeholder: "Search...",
      placeholderStyle: TextStyle(color: Colors.black54),
      style: TextStyle(color: Colors.black),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey4
            : CupertinoColors.systemGrey5,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
