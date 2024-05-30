import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/presentation/screen/home/homePageAppBar.dart';
import 'package:instagram_clone/presentation/screen/home/postContainers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/provider/appProvider.dart';
import '../../../controller/repository/authenticationRepo.dart';
import 'package:badges/badges.dart' as badges;

import '../../widgets/storiesCircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: CustomAppBar(height: height, width: width),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  // color: Colors.white30,
                  height: height * 0.145,
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return StoriesCircle(isUserStoryCircle: true);
                      } else {
                        return StoriesCircle(isUserStoryCircle: false);
                      }
                    },
                  ),
                ),
                ...List.generate(20, (index) {
                  return PostContainer(height: height, width: width);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget logoutAlert() {
    return AlertDialog(
      title: Text("Logout"),
      content: Text("Do you want to logout?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              AuthenticationRepository().logOut().then((value) async {
                print("value >>>> $value");
                // Navigator.of(context).pushReplacementNamed("/");
              });
            },
            child: Text("YES")),
        ElevatedButton(onPressed: () {}, child: Text("NO"))
      ],
    );
  }
}
