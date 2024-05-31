import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/provider/appProvider.dart';
import '../../models/arguments.dart';

class SplashScreen extends StatefulWidget {
  final Function updateWidget;
  const SplashScreen({super.key, required this.updateWidget});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkUser = false;
  bool isLoading = false;
  checkUserData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    var userDataString = sharedUser.getString('user');
    var userString = sharedUser.getString('authToken');

    print("userDataString :::::::: $userDataString");
    print("userString :::::::: $userString");
    if (userDataString != null) {
      checkUser = true;
      final appProvider = Provider.of<AppProvider>(context, listen: false);
      // appProvider.updateUser(userFromJson(userDataString));
      // appProvider.updateUser(UserModel(token: userDataString));
    } else {
      checkUser = false;
    }
  }

  void navigate() {
    checkUserData();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isLoading = true;
      });
      if (checkUser) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        widget.updateWidget(1, UserArguments(newUser: true));
      }
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacementNamed('/customBottonNaviBar');
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Center(
          child: Image.asset(
            "assets/image/instagram.png",
            height: height * 0.2,
            width: width * 0.2,
          ),
        ),
        Positioned(
          bottom: height * 0.03,
          left: height * 0.18,
          child: Center(
            child: Column(
              children: [
                Text(
                  "From",
                  style: TextStyle(color: Colors.white54),
                ),
                Image.asset(
                  "assets/image/meta.png",
                  height: height * 0.044,
                  width: width * 0.24,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
