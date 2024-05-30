import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileUserDetails extends StatefulWidget {
  final double height;
  final double width;
  final bool isUserAddedStory;
  const ProfileUserDetails(
      {super.key,
      required this.height,
      required this.width,
      required this.isUserAddedStory});

  @override
  State<ProfileUserDetails> createState() => _ProfileUserDetailsState();
}

class _ProfileUserDetailsState extends State<ProfileUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height * 0.12,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: widget.width * 0.015,
                          right: widget.width * 0.015),
                      width: widget.width * 0.21,
                      height: widget.height * 0.21,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white30,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
                          imageBuilder: (context, imageProvider) => Center(
                            child: Container(
                              height: widget.height * 0.087,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: widget.height * 0.015,
                      right: widget.height * 0.015,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: widget.height * 0.022,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
                TextWithNumber(
                    title: "posts", count: "750", height: widget.height),
                TextWithNumber(
                    title: "followers", count: "5,620", height: widget.height),
                TextWithNumber(
                    title: "following", count: "750", height: widget.height),
              ]),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: widget.width * 0.03, top: widget.height * 0.01),
          child: Text(
            "Jefrin Johnson",
            style: TextStyle(
                fontSize: widget.height * 0.02,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.width * 0.03),
          child: Text(
            "Artist",
            style:
                TextStyle(fontSize: widget.height * 0.017, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.width * 0.03),
          child: Text(
            "Music is the strongest form of magic",
            style:
                TextStyle(fontSize: widget.height * 0.017, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget TextWithNumber({title, count, height}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
              fontSize: height * 0.023,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        // SizedBox(height: height * 0.001),
        Text(
          title,
          style: TextStyle(fontSize: height * 0.017, color: Colors.white),
        ),
      ],
    );
  }
}
