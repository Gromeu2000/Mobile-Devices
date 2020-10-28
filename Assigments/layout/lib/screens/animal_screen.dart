import 'package:flutter/material.dart';
import '../widgets/padding.dart';


class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 8, child: AdoptionPreview()),
          Expanded(flex: 6, child: AdoptionReview()),
          Expanded(flex: 3, child: AdoptionFeed()),
        ],
      ),
    );
  }
}

class AdoptionPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        ),
    );
  }
}


class AdoptionReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        ),
    );
  }
}

class AdoptionFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 24, 16, 30),
      child: Column(
        children: [
          Feed(),
        ],
      ),
      
    );
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.teal[900],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}