import 'package:flutter/material.dart';
import '../widgets/product_feature.dart';

class LampScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: _LampPreview()),
          Expanded(flex: 6, child: _LampInformation()),
        ],
      ),
    );
  }
}

class _LampPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
        ),
      ),
    );
  }
}

class _LampInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Title(),
          SizedBox(height: 4),
          _Description(),
          SizedBox(height: 16),
          _Features(),
          Spacer(),
          _Price(),
        ],
      ),
    );
  }
}

class _Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductFeature(icon: 'lamp', value: 26, units: 'W'),
        ProductFeature(icon: 'vruler', value: 28, units: 'cm'),
        ProductFeature(icon: 'hruler', value: 26, units: 'cm'),
        ProductFeature(icon: 'plug', value: 1.6, units: 'm'),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Melodi',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        SizedBox(width: 8),
        Text(
          'lamp',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 22,
          ),
        ),
        Spacer(),
        FloatingActionButton(
          mini: true,
          onPressed: () {},
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Ipsum nulla Lorem aliquip quis occaecat cupidatat exercitation '
      'duis dolore sit minim nisi. Esse dolor esse nostrud eiusmod.',
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}

class _Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$12.89',
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
