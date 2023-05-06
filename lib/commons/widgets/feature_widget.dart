// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  final String featureImgUrl;
  final String featureName;
  final double height;
  final double width;

  final void Function()? onTap;
  const FeatureWidget({
    Key? key,
    required this.featureImgUrl,
    required this.featureName,
    this.height = 35,
    this.width = 35,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            featureImgUrl,
            height: height,
            width: width,
          ),
          Text(
            featureName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                letterSpacing: 0.3),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
