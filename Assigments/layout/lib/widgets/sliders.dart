import 'package:flutter/material.dart';

class CatSlider extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double radius;

  const CatSlider({
    @required this.width,
    @required this.height, 
    @required this.color,
    @required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: this.height,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(
          Radius.circular(this.radius)
          ),
      ),
    );
  }
}