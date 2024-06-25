import 'package:flutter/material.dart';
import 'package:moniehomes/src/presentation/widgets/ios_slider.dart';

class HomesDisplayWidget extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final double containerRadius;
  final double marginDistance;

  const HomesDisplayWidget(
      {required this.height,
      required this.width,
      required this.image,
      this.containerRadius = 30,
      this.marginDistance = 5});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(containerRadius))),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(containerRadius)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: width * .07,
            top: height * .6,
            child: IosSlider(
              height: 60,
              width: width,
              text: 'Gladkova St., 25',
            ))
      ],
    );
  }
}
