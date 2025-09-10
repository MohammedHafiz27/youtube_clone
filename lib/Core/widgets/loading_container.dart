import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key, this.height, this.width, this.margin});
  final double? height;
  final double? width;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin ?? 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey4.withAlpha(120)
            : CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
