import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:letslokal/Provider/app_state.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/OnBoarding/login-screen.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// for testing github

// for displaying LOGIN
// bool isUserExist = false;

bool isSelect = false;
bool isOrder = false;
var isNewUser = Preference.pref.getBool("isNewUser") ?? true;
// Boolians for Api

bool loading = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Preference.pref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppState()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            fontFamily: "ProximaNova",
          ),
          home: isNewUser ? const LoginPage() : HomeNav(selectindex: 1),
        ));
  }
}
