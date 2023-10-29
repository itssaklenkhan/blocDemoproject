import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class ErrorWidgetView extends StatelessWidget {
  final String errorMsg;

  const ErrorWidgetView({required this.errorMsg, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const Icon(
            Icons.error_outline,
            size: 50,
          ),
          Text(
            errorMsg,
            style: const TextStyle().bold,
          ),
        ],
      ),
    );
  }
}
