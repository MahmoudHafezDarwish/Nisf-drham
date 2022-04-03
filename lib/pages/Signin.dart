import 'package:drham/pages/select_income_curancy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../providers/UserProvider.dart';
import '../theme/Style.dart';
import '../theme/colors.dart';
import '../widget/Buttons.dart';
import '../widget/inputbox.dart';
import '../widget/snackbar.dart';
import 'Dashboard.dart';
import 'ForgotPass.dart';
import 'Signup.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email, pass;
  bool email_error = false, pass_error = false;
  bool isloading = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    email = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  void sigin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
      print("login");
      print(userCredential);
      print("user instance");
      print(userCredential.user);

      Provider.of<UserProvider>(context, listen: false)
          .fetchLogedUser()
          .then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          email_error = true;
          isloading = false;
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: "No user found for this email!")
              .show();
        });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        isloading = false;
        pass_error = true;
        setState(() {
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: "Wrong password provided for this user!")
              .show();
        });
        print('Wrong password provided for that user.');
      } else {
        isloading = false;
        pass_error = true;
        print(e.code);
        setState(() {
          CustomSnackBar(
                  actionTile: "close",
                  haserror: true,
                  scaffoldKey: scaffoldKey,
                  isfloating: false,
                  onPressed: () {},
                  title: e.code)
              .show();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      key: scaffoldKey,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: mainMargin + 6,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(mainMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.bold, fontSize: 40),
              ),
              SizedBox(
                height: mainMargin,
              ),
              Text(
                "Get the big picture on all your money",
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w400,
                    fontSize: subMargin + 4),
              ),
              SizedBox(
                height: 3 * mainMargin,
              ),
              inputBox(
                controller: email,
                error: email_error,
                errorText: "",
                inuptformat: [],
                labelText: "Email Address",
                obscureText: false,
                ispassword: false,
                istextarea: false,
                readonly: false,
                onchanged: (value) {
                  setState(() {
                    email_error = false;
                  });
                },
              ),
              SizedBox(
                height: mainMargin,
              ),
              inputBox(
                controller: pass,
                error: pass_error,
                errorText: "",
                inuptformat: [],
                labelText: "Password",
                readonly: false,
                obscureText: true,
                ispassword: true,
                istextarea: false,
                onchanged: (value) {
                  setState(() {
                    pass_error = false;
                  });
                },
              ),
              SizedBox(
                height: btnLoginMargin,
              ),
              PrimaryButton(
                isloading: isloading,
                borderRadius: 15,
                onPressed: () {
                  if (email.text == '') {
                    print("email null");
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter your email!")
                          .show();
                      email_error = true;
                    });
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email.text)) {
                    print("not  email");
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter valid email!")
                          .show();
                      email_error = true;
                    });
                  } else if (pass.text == '') {
                    setState(() {
                      CustomSnackBar(
                              actionTile: "close",
                              haserror: true,
                              isfloating: false,
                              scaffoldKey: scaffoldKey,
                              onPressed: () {},
                              title: "Please enter your password!")
                          .show();

                      pass_error = true;
                    });
                  } else {
                    setState(() {
                      isloading = true;
                    });

                    print("calling signin");
                    sigin(context);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Dashboard()),
                            (route) => false);
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(builder: (context) => Currency()),
                    //         (route) => false);
                  }
                },
                title: "Login",
                backgroundColor: primary,
                foregroundColor: white,
                height: 55,
              ),
              SizedBox(
                height: mainMargin,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPass()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: mainMargin - 2, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(height: mainMargin,),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signup()));
                  },
                  child: Text(
                    "New here? Create New Account",
                    style: TextStyle(
                      color: Colors.indigo,
                        fontSize: mainMargin - 2,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: primary,
        elevation: 4.0,
        icon: const Icon(Icons.login),
        label: const Text('Login With Google'),
        onPressed: signInWithGoogle,
      ),
    );
  }
  // void _authenticateWithGoogle() async {
  //   await GoogleSignIn().signOut();
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;
  //   // TODO Replace with AuthCredential Login once packages updated
  //   await _auth.signInWithGoogle(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  // }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
