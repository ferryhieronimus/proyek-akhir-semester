import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ArtikelCard extends StatelessWidget {
  final String imagePath, titleText, descriptionText;
  final Function onTap;
  final double height, width;
  final Color backgroundColor, shadowColor;
  const ArtikelCard({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.titleText,
    required this.descriptionText,
    required this.onTap,
    required this.backgroundColor,
    required this.shadowColor,
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
              // spreadRadius: 10.0,
              // blurRadius: 10.0,
              offset: const Offset(8, 8),
            ),
          ]),
          child: GestureDetector(
            onTap: () => onTap(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    imagePath,
                    width: height,
                    height: height,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: width / 2,
                    height: height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              titleText,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              descriptionText,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                  fontFamily: 'Helvetica'
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
