import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileHighlights extends StatefulWidget {
  const ProfileHighlights({super.key});

  @override
  State<ProfileHighlights> createState() => _ProfileHighlightsState();
}

class _ProfileHighlightsState extends State<ProfileHighlights> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://static.vecteezy.com/system/resources/thumbnails/006/240/302/small_2x/abstract-soft-focus-sunset-field-landscape-of-yellow-flowers-and-grass-meadow-warm-golden-hour-sunset-sunrise-time-tranquil-spring-summer-nature-closeup-and-blurred-forest-background-idyllic-nature-photo.jpg",
                  imageBuilder: (context, imageProvider) => Center(
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.15,
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
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 7, right: 7),
                  width: width * 0.172,
                  height: height * 0.172,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white38,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Trip",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: height * 0.015),
          ),
          SizedBox(height: height * 0.01)
        ]);
  }
}
