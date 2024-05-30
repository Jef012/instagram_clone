// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.black,
//             pinned: true,
//             expandedHeight: height * 0.25,
//             // flexibleSpace: FlexibleSpaceBar(
//             //   title: Padding(
//             //     padding: const EdgeInsets.all(8.0),
//             //     child: CustomSearchBar(),
//             //   ),
//             // ),
//             title: SizedBox(
//               height: height * 0.06,
//               child: SearchBar(
//                 backgroundColor: MaterialStatePropertyAll(Colors.white24),
//                 shape: MaterialStatePropertyAll(
//                   RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 leading: Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//                 hintText: "Search",
//                 hintStyle:
//                     MaterialStatePropertyAll(TextStyle(color: Colors.white54)),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//               child: Container(
//             height: 400,
//             child: GridView.custom(
//               gridDelegate: SliverQuiltedGridDelegate(
//                 crossAxisCount: 4,
//                 mainAxisSpacing: 4,
//                 crossAxisSpacing: 4,
//                 repeatPattern: QuiltedGridRepeatPattern.inverted,
//                 pattern: [
//                   QuiltedGridTile(2, 2),
//                   QuiltedGridTile(1, 1),
//                   QuiltedGridTile(1, 1),
//                   QuiltedGridTile(1, 2),
//                 ],
//               ),
//               childrenDelegate: SliverChildBuilderDelegate(
//                 (context, index) => ,
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: false,
            floating: true,
            snap: false,
            title: SizedBox(
              height: height * 0.057,
              child: SearchBar(
                backgroundColor: const MaterialStatePropertyAll(Colors.white24),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                leading: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Search",
                hintStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 2),
                ],
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                      ],
                    ),
                  );
                },
                childCount: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
