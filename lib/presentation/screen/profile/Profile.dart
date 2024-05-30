import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/presentation/screen/profile/profileHighlights.dart';
import 'package:instagram_clone/presentation/screen/profile/profileUserDetails.dart';

import '../../widgets/storiesCircle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isUserAddedStory = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int itemCount = 50;

    int itemsPerRow = 3;

    int numRows = (itemCount / itemsPerRow).ceil();
    print("numRows :: $numRows");

    double itemHeight = height * 0.165;
    print("itemHeight :: $itemHeight");

    double gridViewHeight = numRows * itemHeight;
    print("gridViewHeight :: $gridViewHeight");

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "_jefrinjohnson",
              style: TextStyle(fontSize: height * 0.0275),
            ),
            SizedBox(width: width * 0.01),
            Image.asset(
              "assets/image/Verified badge.png",
              height: height * 0.04,
              width: width * 0.05,
            ),
            SizedBox(width: width * 0.01),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        actions: [
          Image.asset(
            "assets/image/threadsLogo.png",
            height: height * 0.065,
            width: width * 0.08,
          ),
          SizedBox(width: width * 0.05),
          Container(
            margin:
                EdgeInsets.only(top: height * 0.009, bottom: height * 0.009),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.white,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(height * 0.002),
              child: Icon(
                Icons.add,
                size: height * 0.02,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: width * 0.05),
          Icon(Icons.menu, size: height * 0.035),
          SizedBox(width: width * 0.04),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            ProfileUserDetails(
              height: height,
              width: width,
              isUserAddedStory: true,
            ),
            SizedBox(height: height * 0.005),
            Row(
              children: [
                CustomButton(
                  title: "Edit Profile",
                  height: height,
                  width: width,
                  onPressed: () {},
                ),
                CustomButton(
                  title: "Share Profile",
                  height: height,
                  width: width,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: height * 0.145,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProfileHighlights();
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Padding(
                        padding: EdgeInsets.all(height * 0.01),
                        child: Icon(Icons.grid_on_sharp),
                      ),
                      Icon(Icons.grid_on_sharp),
                      Icon(Icons.grid_on_sharp),
                    ],
                    indicatorColor: Colors.white,
                  ),
                  SizedBox(
                    height: gridViewHeight,
                    child: TabBarView(
                      children: [
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: itemsPerRow,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                child: Text(
                                  'Item $index',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: itemsPerRow,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[800],
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      'Item $index',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: height * 0.02,
                                        ),
                                        Text(
                                          '5,${index + 5}$index${index + 2}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    bottom: height * 0.007,
                                    left: height * 0.007,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Center(
                          child: Text(
                            'Tab 3 Content',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomButton({title, onPressed, height, width}) {
    return Expanded(
      child: SizedBox(
        height: height * 0.055,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(title),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              backgroundColor: MaterialStateProperty.all(
                Colors.white24.withOpacity(0.15),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
