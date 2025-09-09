import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({super.key, required this.button});
  final ActionButtonModel button;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(button.icon, size: 20),
      label: Text(button.label),

      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: .2)
            : Colors.grey.shade200,
        shape: const StadiumBorder(),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
