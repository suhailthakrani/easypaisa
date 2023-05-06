import 'package:easypaisa/commons/widgets/feature_widget.dart';
import 'package:easypaisa/screens/home/components/more_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FourthView extends StatelessWidget {
  const FourthView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // shrinkWrap: true,
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      // ),
      children: [
        Container(
          height: 100,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/easycash loan.png",
                  featureName: "Packages",
                ),
              ),
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/Internet.png",
                  featureName: "Internet",
                ),
              ),
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/easycash loan.png",
                  featureName: "Packages",
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 100,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/Internet.png",
                  featureName: "Internet",
                ),
              ),
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/easycash loan.png",
                  featureName: "Packages",
                ),
              ),
              Expanded(
                  child: MoreWidget(featureImgUrl: '', featureName: 'More'))
            ],
          ),
        ),
      ],
    );
  }
}
