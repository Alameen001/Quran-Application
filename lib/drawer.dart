import 'dart:ui';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp1/privacypolicy.dart';
import 'package:quranapp1/screens/drowr.dart';
import 'package:share_plus/share_plus.dart';

bool isSwiteched = false;

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          splashColor: Colors.transparent,
          onPressed: () {
            if (_bool == true) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            _bool = false;
          },
        ),
      ),
      body: Stack(
        children: [
          // ALWAYS PLACE IT ON THE TOP OF EVERY WIDGET...
          BackgroundImage(),

          // EVERYTHING SHOULD BE HERE...
          SizedBox(
            height: _height,
            width: _width,
            child: null,
          ),

          // ALWAYS PLACE IT ON THE BOTTOM OF EVERY WIDGET...
          CustomNavigationDrawer(),
          // Column(mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Center(child: FloatingActionButton(onPressed: () {})),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: Container(
        height: _bool ? 0 : _height,
        width: _bool ? 0 : _width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              width: _width * .9,
              height: _width * 1.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/Gold Modern Ramadan Poster.jpg' ,
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.nightlight),
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: isSwiteched,
                          onChanged: (value) {
                            setState(() {
                              isSwiteched = value;
                              isSwiteched
                                  ? AdaptiveTheme.of(context).setDark()
                                  : AdaptiveTheme.of(context).setLight();

                              isSwiteched = value;
                              isSwiteched
                                  ? Fluttertoast.showToast(
                                      msg: 'Dark Mode On',
                                    )
                                  : Fluttertoast.showToast(
                                      msg: 'Dark Mode Off',
                                    );
                            });
                          },
                        ),
                      ),

                      // MyTile(Icons.nightlight, 'DarkMode', () {
                      //  Switch(value: isSwiteched, onChanged: (value){
                      //   setState(() {
                      //     isSwiteched =value;
                      //     isSwiteched?AdaptiveTheme.of(context).setDark():
                      //     AdaptiveTheme.of(context).setLight();
                      //   });
                      //  });
                      //   Fluttertoast.showToast(
                      //     msg: 'Button pressed',
                      //   );
                      // }),
                      MyTile(Icons.share_rounded, 'Share', () async {
                        await Share.share(
                            'https://www.instagram.com/ameen_aash/');
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                      MyTile(Icons.feedback_outlined, 'Feedback', () {
                        HapticFeedback.lightImpact();
                        Fluttertoast.showToast(
                          msg: 'Button pressed',
                        );
                      }),
                      MyTile(Icons.find_in_page_outlined, 'Privacy Policy', () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PolicyDialog(
                                  mdFileName: "privacy_policy.md");
                            });
                        Fluttertoast.showToast(
                          msg: 'Privacy Policy',
                        );
                      }),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BackgroundImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        "assets/Black and White Qur'an Ramadan Mobarek Instagram Story.jpg",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget MyTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}
