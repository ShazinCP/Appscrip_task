import 'package:appscrip_task/helper/colors.dart';
import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({
    super.key,
    required this.content,
    required this.keyValue,
  });

  final String content;
  final String keyValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 410,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17), color: cPrimaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            keyValue,
            style: const TextStyle(
              color: cWhiteColor70,
              fontSize: 16,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              color: cWhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
