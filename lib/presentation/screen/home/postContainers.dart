import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatefulWidget {
  final double height;
  final double width;
  const PostContainer({super.key, required this.height, required this.width});

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final CarouselController _controller = CarouselController();
    return Column(
      children: [
        SizedBox(height: widget.height * 0.01),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          width: widget.width,
          height: widget.height * 0.065,
          child: Row(children: [
            SizedBox(width: widget.width * 0.03),
            SizedBox(
              width: widget.width * 0.082,
              child: CachedNetworkImage(
                imageUrl:
                    "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
                imageBuilder: (context, imageProvider) => Center(
                  child: Container(
                    height: widget.height * 0.045,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: widget.width * 0.03),
            Text(
              "Harry045",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.height * 0.015),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                ))
          ]),
        ),
        CarouselSlider(
          items: [
            Container(
              color: Colors.blueGrey,
              height: 150,
            ),
            Container(
              color: Colors.redAccent,
              height: 150,
            ),
            Container(
              color: Colors.cyan,
              height: 150,
            ),
          ],
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: false,
              initialPage: 0,
              aspectRatio: 1.0,
              viewportFraction: widget.width,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height * 0.065,
          child: Row(
            children: [
              SizedBox(width: widget.width * 0.03),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  )),
              Image.asset(
                "assets/image/comment.png",
                color: Colors.white,
                height: widget.height * 0.03,
              ),
              SizedBox(width: widget.width * 0.03),
              Image.asset(
                "assets/image/send.png",
                color: Colors.white,
                height: widget.height * 0.03,
              ),
            ],
          ),
        ),
        SizedBox(height: widget.height * 0.01),
      ],
    );
  }
}
