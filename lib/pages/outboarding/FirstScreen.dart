import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutBoardingContentScreen extends StatelessWidget {
  final String title;

  final String subTitle;

  final String image;

  OutBoardingContentScreen({this.title, this.subTitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            image,
            matchTextDirection: true,
            fit: BoxFit.fill,
            height: 283,
            // width: double.infinity,
            alignment: Alignment.topCenter,
          ),
        ),
        // Image(
        //   alignment: Alignment.topCenter,
        //   fit: BoxFit.fill,
        //   image: AssetImage(image),
        //   height: 283,
        //   width: double.infinity,
        // ),
        SizedBox(height: 15,),

        Text(
          title,
          style: TextStyle(
              fontFamily: 'Besley-Bold',
              fontWeight: FontWeight.w900,
              fontSize: 22,
              color: Colors.black,
              backgroundColor: Colors.transparent),
        ),
        SizedBox(height: 10,),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Besley-Regular',
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.black,
              backgroundColor: Colors.transparent),
        ),
      ],
    );
  }
}
