// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, this.onPressed, required this.icon});

  final VoidCallback? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.primary,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
