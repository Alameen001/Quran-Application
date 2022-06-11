// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({ Key? key }) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body: Container(
//           height: double.infinity,
//           width: double.infinity,
//         child: Image.asset('assets/ameen1.jpg'  , width: double.infinity, height:double.infinity, fit: BoxFit.cover,),

//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quranapp1/screens/screenhome.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    gotologin();
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
        "assets/Black and White Qur'an Ramadan Mobarek Instagram Story.jpg",
        fit: BoxFit.cover,
         
        ),
      ),
    );
  }

  Future<void> gotologin() async {
    await Future.delayed(Duration(seconds:4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return Screenhome();
    }));
  }
}
