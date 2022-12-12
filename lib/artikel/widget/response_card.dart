import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {
  final double height, width;
  final Color backgroundColor, shadowColor;
  final String responseText;

  const ResponseCard({
    super.key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.shadowColor,
    required this.responseText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: backgroundColor, boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 1.0,
            blurRadius: 30.0,
            offset: const Offset(8, 8),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\"",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                  ),
                ),
              ),
              Text(
                responseText,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
