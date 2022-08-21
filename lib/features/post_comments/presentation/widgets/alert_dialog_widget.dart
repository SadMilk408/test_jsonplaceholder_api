import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget additionalContent;
  final List<Widget> actions;

  const AlertDialogWidget({
    required this.title,
    required this.additionalContent,
    required this.actions,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text(title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              additionalContent,
            ],
          ),
          actions: actions
        );
      },
    );
  }
}
