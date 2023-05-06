// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoreWidget extends StatelessWidget {
  final String featureImgUrl;
  final String featureName;
  final void Function()? onTap;

  const MoreWidget({
    Key? key,
    required this.featureImgUrl,
    required this.featureName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Image.asset(
                "assets/icons/circle.png",
                height: 8,
                width: 8,
              ),
              SizedBox(width: 5),
              Image.asset(
                "assets/icons/circle.png",
                height: 8,
                width: 8,
              ),
              SizedBox(width: 5),
              Image.asset(
                "assets/icons/circle.png",
                height: 8,
                width: 8,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            featureName,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                letterSpacing: 0.3),
          ),
        ],
      ),
    );
  }
}
