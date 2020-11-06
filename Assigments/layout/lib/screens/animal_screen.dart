import 'package:flutter/material.dart';
import '../widgets/sliders.dart';

//MAIN SCREEN-----------------------------------------------

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(flex: 5, child: AnimalPreview()),
            Expanded(flex: 3, child: AnimalInfo()),
            Expanded(flex: 2, child: CatData()),
          ],
        ),
    );
  }
}

//1/3 OF SCREEN---------------------------------------------------


class AnimalPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          color: Color.fromRGBO(192, 204, 207, 1),
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
          Expanded(flex: 3, child: Photo()),
          Expanded(flex: 1, child: Slide()),
         ],
       )
    );
  }
}

// CAT PICTURE-------

class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/dev22.png');
  }
}

// SLIDERS--------------

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CatSlider(width: 15, height: 5, color: Color.fromRGBO(48, 96, 96, 1), radius: 10),
        SizedBox(width: 5),
        CatSlider(width: 5, height: 5, color: Colors.white, radius: 10),
        SizedBox(width: 5),
        CatSlider(width: 5, height: 5, color: Colors.white, radius: 10),
        ],
      ),
    );
  }
}



// 2/3 OF SCREEN------------------------------


class AnimalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 100, 16, 0),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OwnerInfo(),
          SizedBox(height: 8),
          OwnerDescription(),
        ],
      ),
       color: Colors.grey[100],
    );
  }
}

//OWNER PROFILE---------

class OwnerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OwnerPic(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
          'Maya Berkovskaya',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 12
          ),
        ),
        SizedBox(height: 7),
            SubOwnerInfo(),
          ],
        ),
        Spacer(),
         Text(
          'May 25, 2019',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors. grey[400],
            fontSize: 11
          ),
        ),
      ],
    );
  }
}

//PIC OWNER----------

class OwnerPic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/owner.png');
  }
}

//INDICATOR OWNER--------

class SubOwnerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
      'Owner',
      style: TextStyle(
          fontFamily: 'Roboto',
           fontWeight: FontWeight.w400,
           color: Colors. grey[400],
           fontSize: 11
      ),
    ),
  );
    
  }
}

//COMMENT OWNER--------

class OwnerDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Text( "My job requires moving to another country. I don't "
      "have the opportunity to take the cat with me. I am "
      "looking for good people who will shelter my Sola.",
      style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors. grey[500],
            fontSize: 12,
      ),
      ),
    );
  }
}


// 3/3 OF SCREEN------------------------------------

class CatData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
     ),
     child: Row(
       children: [
         Like(),
        //  CatSlider(width: 70, height: 60, color: Color.fromRGBO(48, 96, 96, 1), radius: 20),
       ],
     ),    
    );
  }
}


class Like extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 70,
        height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 96, 96, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(20)
          ),
      ),
      child: Icon(
        Icons.favorite_outline,
        color: Colors.white,
      )
    );
  }
}
