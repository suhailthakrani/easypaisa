import 'package:easypaisa/commons/widgets/feature_widget.dart';
import 'package:easypaisa/screens/home/components/more_widget.dart';
import 'package:flutter/cupertino.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SizedBox(
          height: 90,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/ADA.png",
                  featureName: "Bill Payment",
                ),
              ),
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/Other Mobile Account.png",
                  width: 40,
                  height: 40,
                  featureName: "Mobile \nPackages",
                ),
              ),
              Expanded(
                child: FeatureWidget(
                  onTap: () {
                    //
                  },
                  featureImgUrl: "assets/icons/easycash loan.png",
                  featureName: "Easyload",
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 90,
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
                  featureImgUrl: "assets/icons/eidi.png",
                  featureName: "Eidi",
                ),
              ),
              const Expanded(
                  child: MoreWidget(featureImgUrl: '', featureName: 'More'))
            ],
          ),
        ),
      ],
    );
  }
}
