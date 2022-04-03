import 'package:drham/pages/Splash.dart';
import 'package:drham/providers/UserProvider.dart';
import 'package:drham/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Draham());
}

class Draham extends StatelessWidget {
  const Draham({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Nisf Dirham',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primarySwatch: MaterialColor(0xFF2C3137, {
              50: Color(0xFF2C3137),
              100: Color(0xFF2C3137),
              200: Color(0xFF2C3137),
              300: Color(0xFF2C3137),
              400: Color(0xFF2C3137),
              500: Color(0xFF2C3137),
              600: Color(0xFF2C3137),
              700: Color(0xFF2C3137),
              800: Color(0xFF2C3137),
              900: Color(0xFF2C3137)
            }),
            appBarTheme: AppBarTheme(
                brightness: Brightness.light,
                backgroundColor: white,
                elevation: 0),

            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: white),
        home: SplashScreen(),
      ),
    );
  }
}

