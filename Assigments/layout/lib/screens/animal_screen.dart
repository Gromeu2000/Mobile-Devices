import 'package:flutter/material.dart';
import '../widgets/sliders.dart';

//MAIN SCREEN-----------------------------------------------

class AnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
               Column(
                children: [
                  Expanded(flex: 5, child: AnimalPreview()),
                  Expanded(flex: 3, child: AnimalInfo()),
                  Expanded(flex: 2, child: CatInteraction()),
                ],
              ),
              Align(
              alignment: Alignment.center,
              child: CatData(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 30),
                  child: BackButton(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 30),
                  child: Logout(),
                ),
              ),
            ],
          ),
       ),   
    );
  }
}

//GENERAL BUTTONS-----------------------
class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.west_outlined,
      color: Colors.grey[600],
      size: 30
    );
  }
}

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.logout,
      color: Colors.grey[600],
      size: 30
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
    return Image.asset('assets/cat.png');
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
            fontWeight: FontWeight.w500,
            color: Colors. grey[500],
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
           fontWeight: FontWeight.w500,
           color: Colors. grey[500],
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
            fontFamily: 'Noto Serif',
            fontWeight: FontWeight.w500,
            color: Colors. grey[600],
            fontSize: 12,
      ),
      ),
    );
  }
}


// 3/3 OF SCREEN------------------------------------

class CatInteraction extends StatelessWidget {
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
        Adopt(),
       ],
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     ),    
    );
  }
}

//LIKE BUTTON------------

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
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(4,4),
              blurRadius: 9,
            ),
          ],
      ),
      child: Icon(
        Icons.favorite_outline,
        color: Colors.white,
      )
    );
  }
}

//ADOPT BUTTON---------------

class Adopt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 200,
        height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 96, 96, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(20)
          ),
           boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(4,4),
              blurRadius: 9,
            ),
          ],
      ),
        child: Center(
          child: Text(
            'Adoption',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              color: Colors.white,
               fontSize: 15,
            ),
          ),
        ),
    );
  }
}




//MID SCREEN-------------------------
class CatData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: 450,
        height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(35)
        ),
         boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2,2),
              blurRadius: 15,
            ),
          ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NameGender(),
          SizedBox(height: 5),
          TypeAge(),
          SizedBox(height: 10),
          Location(),
        ],
      ),
    );
  }
}



// FIRST ROW----------------------
class NameGender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sola',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w700,
            color: Colors.grey[700],
             fontSize: 30,
          ),
        ),
        Image.asset('assets/gender.png'),
      ],
    );
  }
}
 

// SECOND ROW-------------------
class TypeAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Abyssinian cat',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
             fontSize: 15,
          )
        ),
        Text(
          '2 years old',
           style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
             fontSize: 15,
          ),
        ),
      ],
    );
  }
}



//THIRD ROW--------------------------
class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Icon(
          Icons.location_on,
           color: Color.fromRGBO(48, 96, 96, 1),
           size: 20,
        ),
        SizedBox(width: 5),
        Text(
          '5 Bulvarno-Kudriavska Street, Kyiv',
           style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            color: Colors.grey[350],
             fontSize: 15,
          ),
        ),
      ],
    );
  }
}
