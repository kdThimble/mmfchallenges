import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/providers/user_provider.dart';
import 'package:meetmefitchallenges/responsive/mobile_screen_layout.dart';
import 'package:meetmefitchallenges/responsive/responsive_layout_screen.dart';
import 'package:meetmefitchallenges/responsive/web_screen_layout.dart';
import 'package:meetmefitchallenges/screens/login_screen.dart';
import 'package:meetmefitchallenges/screens/signup_screen.dart';
import 'package:meetmefitchallenges/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Initialize Web App with Firebase Options
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyDDkSMDMmfem9701RKbYjX59oSMMcIMSB4',
            appId: '1:452062820879:web:e50ef6e54980d0ed16417a',
            messagingSenderId: '452062820879',
            projectId: 'meetmefit-challenges',
            storageBucket: 'meetmefit-challenges.appspot.com'));
  } else {
    // Initialize Mobile App with Firebase
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyDDkSMDMmfem9701RKbYjX59oSMMcIMSB4',
            appId: '1:452062820879:web:e50ef6e54980d0ed16417a',
            messagingSenderId: '452062820879',
            projectId: 'meetmefit-challenges',
            storageBucket: 'meetmefit-challenges.appspot.com'));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MeeMeFit Challenges',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                // This means that whenever the connection is active and our snapshot has any data we are going to return a responsive layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',
                  ),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: mmfOrange,
                ),
              );
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
