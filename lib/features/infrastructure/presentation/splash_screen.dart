import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/main_app_screen.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

// FIREBASE CODE
  // @override
  // Widget build(BuildContext context) {
//     print("IN SPLASH SCREEN WIDGET BUILD");
//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance
//           .collection('Configuration')
//           .doc('isFirstUse')
//           .get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print("Waiting...");
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           print("IN ERROR");
//           return Text('Error: ${snapshot.error}');
//         } else if (snapshot.hasData && snapshot.data!.exists) {
//           print("DATA EXISTS");
//           bool isFirstUse = snapshot.data!.get('isFirstUse');
//           print("IS_FIRST_USE: $isFirstUse");

//           if (isFirstUse) {
//             print("IS_FIRST_USE");
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => const InitRegistrationScreen()));
//             });
//           } else {
//             print("??");
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => const MainAppScreen()));
//             });
//           }
//         }
//         print("BERFORE RETURN");
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

// WORKING CODE
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 1), () {
//       if (ConfigurationProvider.isFirstUse) {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (context) => const InitRegistrationScreen()));
//       } else {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const MainAppScreen()));
//       }
//     });

//     return MaterialApp(
//       home: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           color: Theme.of(context).primaryColor,
//           child: const Center(
//               child: Image(
//             image: AssetImage("assets/images/logo.png"),
//             width: 130,
//             height: 130,
//           ))),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkFirstUse(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          bool isFirstUse = snapshot.data!;
          print('isFirstUse: $isFirstUse');

          if (isFirstUse) {
            print('Navigating to InitRegistrationScreen');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const InitRegistrationScreen()));
            });
          } else {
            print('Navigating to MainAppScreen');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MainAppScreen()));
            });
          }
        }
        return const SizedBox.shrink();
      },
    );
  }

  Future<bool> _checkFirstUse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstUse = prefs.getBool('isFirstUse');
    if (isFirstUse == null) {
      await prefs.setBool('isFirstUse', false);
      return true;
    } else {
      return isFirstUse;
    }
  }
}
