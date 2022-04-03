import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/Style.dart';
import '../theme/colors.dart';
import '../widget/Buttons.dart';
import 'Signin.dart';
import 'Signup.dart';
import 'outboarding/FirstScreen.dart';
import 'outboarding/outboarding_dot.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  PageController pageController;
  int currentIndex = 0;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    // _animationController?.animateTo(currentIndex as double);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: white),
          child: Stack(
            children: [
              PageView(
                onPageChanged: (int currentPageIndex) {
                  setState(() {
                    currentIndex = currentPageIndex;
                  });
                },
                controller: pageController,
                children: [
                  OutBoardingContentScreen(
                    title: "Expense Tracker",
                    subTitle: "Now! You can track whatever you spend",
                    image: 'assets/images/expenses.png',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: Colors.grey.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            'assets/images/reports.svg',
                            matchTextDirection: true,
                            fit: BoxFit.fill,
                            height: 283,
                            width: 50,
                            // width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      // Image(
                      //   alignment: Alignment.topCenter,
                      //   fit: BoxFit.fill,
                      //   image: AssetImage(image),
                      //   height: 283,
                      //   width: double.infinity,
                      // ),
                      SizedBox(
                        height: 25,
                      ),

                      Text(
                        'Weekly & Monthly Reports',
                        style: TextStyle(
                            fontFamily: 'Besley-Bold',
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Colors.black,
                            backgroundColor: Colors.transparent),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Reportes help to track performance and improve for a bright future',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Besley-Regular',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                              backgroundColor: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  // OutBoardingContentScreen(
                  //   title: "Weekly & Monthly Reports",
                  //   subTitle: "Reportes help to track performance and improve for a bright future",
                  //   image: 'assets/images/reports.svg',
                  // ),
                  OutBoardingContentScreen(
                    title: "Plan Healthy Finance Habits",
                    subTitle:
                        "What are you waiting for? sign in & track financial reports",
                    image: 'assets/images/plan.png',
                  ),
                ],
              ),
              if (currentIndex != 2)
                PositionedDirectional(
                  end: 15,
                  top: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      pageController.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      //elevation: 3,
                    ),
                  ),
                ),
              PositionedDirectional(
                  start: 0,
                  end: 0,
                  bottom: 10,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutBoardingDot(
                            index: 0,
                            currentIndex: currentIndex,
                          ),
                          OutBoardingDot(
                            index: 1,
                            currentIndex: currentIndex,
                          ),
                          OutBoardingDot(
                            index: 2,
                            currentIndex: currentIndex,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (currentIndex == 2)
                        Container(
                          width: 315,
                          height: 53,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                  // Navigator.pushNamed(context, "/login");
                                  // Navigator.pushNamed(context, "/detailsScreen");
                                },
                                child: Text('Start'),
                                style: ElevatedButton.styleFrom(
                                  primary: primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Icon(Icons.arrow_back_ios,
                                color: currentIndex == 0
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.black),
                            onTap: () {
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInBack);
                            },
                          ),
                          InkWell(
                            child: Icon(Icons.arrow_forward_ios,
                                color: currentIndex == 2
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.black),
                            onTap: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Expanded(
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: mainMargin),
          //         decoration: BoxDecoration(
          //           color: white,
          //           // image: DecorationImage(
          //           //     image: AssetImage("assets/onb2.png"),
          //           //     fit: BoxFit.fitWidth),
          //         ),
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: subMargin),
          //                 child: Image(
          //                   image: AssetImage("assets/logot.png"),
          //                   width: 100,
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 6 * subMargin,
          //               ),
          //               PrimaryButton(
          //                 isloading: false,
          //                 onPressed: () {
          //                   Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => SignIn()));
          //                 },
          //                 title: "Login",
          //                 height: 55,
          //                 backgroundColor: primary,
          //                 foregroundColor: white,
          //               ),
          //               // SizedBox(
          //               //   height: 8 * subMargin,
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(
          //           horizontal: mainMargin, vertical: 2 * subMargin),
          //       decoration: BoxDecoration(color: white),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           // Text(
          //           //   "Fitness.",
          //           //   style: TextStyle(
          //           //       color: black,
          //           //       fontWeight: FontWeight.bold,
          //           //       fontSize: 40),
          //           // ),
          //           // Text(
          //           //   "With Friends",
          //           //   style: TextStyle(
          //           //     color: primaryDark,
          //           //     fontWeight: FontWeight.w400,
          //           //     fontSize: 40,
          //           //   ),
          //           // ),
          //           // SizedBox(
          //           //   height: 2 * subMargin,
          //           // ),
          //           // PrimaryButton(
          //           //   isloading: false,
          //           //   onPressed: () {
          //           //     Navigator.push(context,
          //           //         MaterialPageRoute(builder: (context) => SignIn()));
          //           //   },
          //           //   title: "Login",
          //           //   backgroundColor: primary,
          //           //   foregroundColor: white,
          //           // ),
          //           // SizedBox(
          //           //   height: 8 * subMargin,
          //           // ),
          //           Center(
          //             child: InkWell(
          //               onTap: () {
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => Signup()));
          //               },
          //               child: Text(
          //                 "New here? Create New Account",
          //                 style: TextStyle(
          //                     fontSize: mainMargin - 2,
          //                     fontWeight: FontWeight.w400),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}
