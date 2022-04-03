import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/Dashboard.dart';
import '../providers/UserProvider.dart';
import '../widget/snackbar.dart';

class MyAuthFirebase {
  MyAuthFirebase._();

  static MyAuthFirebase _instance = MyAuthFirebase._();
  BuildContext _context;

  static MyAuthFirebase get instance {
    return _instance;
  }

  MyAuthFirebase setContext(BuildContext context) {
    this._context = context;
    return this;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;
  //
  // void sigin(BuildContext context,String email,String pass,) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: pass);
  //     print("login");
  //     print(userCredential);
  //     print("user instance");
  //     print(userCredential.user);
  //
  //     Provider.of<UserProvider>(context, listen: false)
  //         .fetchLogedUser()
  //         .then((value) {
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => Dashboard()),
  //               (route) => false);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       setState(() {
  //         email_error = true;
  //         isloading = false;
  //         CustomSnackBar(
  //             actionTile: "close",
  //             haserror: true,
  //             scaffoldKey: scaffoldKey,
  //             isfloating: false,
  //             onPressed: () {},
  //             title: "No user found for this email!")
  //             .show();
  //       });
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       isloading = false;
  //       pass_error = true;
  //       setState(() {
  //         CustomSnackBar(
  //             actionTile: "close",
  //             haserror: true,
  //             scaffoldKey: scaffoldKey,
  //             isfloating: false,
  //             onPressed: () {},
  //             title: "Wrong password provided for this user!")
  //             .show();
  //       });
  //       print('Wrong password provided for that user.');
  //     } else {
  //       isloading = false;
  //       pass_error = true;
  //       print(e.code);
  //       setState(() {
  //         CustomSnackBar(
  //             actionTile: "close",
  //             haserror: true,
  //             scaffoldKey: scaffoldKey,
  //             isfloating: false,
  //             onPressed: () {},
  //             title: e.code)
  //             .show();
  //       });
  //     }
  //   }
  // }

}
