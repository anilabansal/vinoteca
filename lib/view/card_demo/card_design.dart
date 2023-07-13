import 'package:flutter/material.dart';



class CardDesign extends StatelessWidget {
  final img;
  final cardWidth;
  CardDesign({this.cardWidth, this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: cardWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
            image:  ExactAssetImage(img),
            fit: BoxFit.cover,
          ),
          color: Colors.purple,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
    );
  }
}
